import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/models/item_id_tree.dart';
import 'package:hn_client/view/providers/item_notifier.dart';

// import '../../models/item.dart';

final itemDescendantProvider =
    StateNotifierProvider.family<ItemDescendantNotifier, ItemIdTree, int>(
        (ref, id) {
  final item = ref.watch(itemFamily(id));
  final tree = item.maybeWhen(
    data: (item) {
      final IList<ItemIdTree> children =
          item.childrenIds?.map((e) => ItemIdTree(id)).toIList() ?? emptyIList;
      return ItemIdTree(item.id, children);
    },
    orElse: () => ItemIdTree(id),
  );
  return ItemDescendantNotifier(tree);
});

class ItemDescendantNotifier extends StateNotifier<ItemIdTree> {
  ItemDescendantNotifier(ItemIdTree state) : super(state);

  Future<void> addChildren(List<int> childrenIds) async {
    await Future.microtask(() {
      state = state.addChildren(childrenIds);
    });
  }

  Future<void> addChildrenToId(List<int> childrenIds, int id) async {
    await Future.microtask(
      () {
        state = state.addChildrenToId(childrenIds, id);
      },
    );
  }

  Future<void> collapseId(int id) async {
    await Future.microtask(
      () {
        state = state.collapseId(id);
      },
    );
  }
}
