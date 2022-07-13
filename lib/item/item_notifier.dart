import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/repository/repository.dart';
import 'package:hn_client/item/item_state.dart';

import '../models/item.dart';

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

  int? findAncestor(Item item) {
    final parentId = item.parentId;
    if (parentId == null) return id;
    final parentNotifier = ref.read(itemFamily(parentId).notifier);
    final parentState = ref.read(itemFamily(parentId));

    return parentNotifier.findAncestor(parentState.maybeWhen(
      data: (i) => i,
      orElse: () => item,
    ));
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
        state = ItemState.data(item);
      },
    );
  }
}
