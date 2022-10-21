import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/models/item_detail.dart';

import '../../../repository/repository.dart';
import 'item_detail_state.dart';

final itemDetailFamily =
    StateNotifierProvider.family<ItemDetailNotifier, ItemDetailState, int>(
  (ref, id) {
    final repository = ref.watch(repositoryProvider);

    return ItemDetailNotifier(id: id, repository: repository);
  },
);

class ItemDetailNotifier extends StateNotifier<ItemDetailState> {
  final int id;
  final Repository repository;
  ItemDetailNotifier({required this.id, required this.repository})
      : super(const ItemDetailState.loading()) {
    load();
  }

  ItemDetail? itemTree;

  void load() async {
    if (state != const ItemDetailState.loading()) {
      state = const ItemDetailState.loading();
    }
    final failureOrItem = await repository.getItemDetail(id);
    if (!mounted) return;
    failureOrItem.fold(
      (failure) {
        state = ItemDetailState.error(failure.message);
        Future.delayed(const Duration(seconds: 3), load);
      },
      (item) {
        itemTree = item;
        state = ItemDetailState.data(itemTree!.flatten());
      },
    );
  }

  void collapse(int id) {
    itemTree = itemTree?.collapse(id);
    if (itemTree != null) {
      state = ItemDetailState.data(itemTree!.flatten());
    }
  }
}
