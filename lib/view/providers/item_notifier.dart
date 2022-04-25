import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/repository/repository.dart';
import 'package:hn_client/view/providers/item_state.dart';

import 'comments_notifier.dart';

final itemFamily = StateNotifierProvider.family<ItemNotifier, ItemState, int>(
  (ref, id) {
    final repository = ref.read(repositoryProvider);

    return ItemNotifier(id: id, repository: repository, ref: ref);
  },
);

class ItemNotifier extends StateNotifier<ItemState> {
  final int id;
  final Repository repository;
  final StateNotifierProviderRef ref;
  ItemNotifier({required this.id, required this.repository, required this.ref})
      : super(const ItemState.loading()) {
    load();
  }

  void load() async {
    final failureOrItem = await repository.getItem(id);
    if (!mounted) return;
    failureOrItem.fold(
      (failure) {
        state = ItemState.error(failure.message);
        Future.delayed(const Duration(seconds: 3), load);
      },
      (item) {
        return state = ItemState.data(item);
      },
    );
  }

  void getComments() {
    state.maybeWhen(
      data: (item) {
        final comments = ref.read(commentsNotifierProvider(id).notifier);
        comments.seed(item);
      },
      orElse: () {},
    );
  }
}
