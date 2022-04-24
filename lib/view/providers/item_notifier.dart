import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/repository/repository.dart';
import 'package:hn_client/view/providers/item_state.dart';

final itemFamily =
    StateNotifierProvider.family<ItemNotifier, ItemState, int>((ref, id) {
  final repository = ref.read(repositoryProvider);
  return ItemNotifier(id: id, repository: repository);
});

class ItemNotifier extends StateNotifier<ItemState> {
  final int id;
  final Repository repository;
  ItemNotifier({
    required this.id,
    required this.repository,
  }) : super(const ItemState.loading()) {
    load();
  }

  void load() async {
    final failureOrItem = await repository.getItem(id);
    failureOrItem.fold(
      (failure) {
        state = ItemState.error(failure.message);
        Future.delayed(const Duration(seconds: 3), load);
      },
      (item) => state = ItemState.data(item),
    );
  }
}
