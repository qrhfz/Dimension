import 'dart:developer';

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
      final ids = item.childrenIds;
      if (ids == null) {
        return ItemIdTree(item.id);
      }
      final List<ItemIdTree> children = [];

      for (var id in ids) {
        children.add(ItemIdTree(id));
      }

      return ItemIdTree(item.id, children.toIList());
    },
    orElse: () => ItemIdTree(id),
  );
  return ItemDescendantNotifier(tree);
});

class ItemDescendantNotifier extends StateNotifier<ItemIdTree> {
  ItemDescendantNotifier(super.state);

  // Future<void> addChildren(List<int> childrenIds) async {
  //   await Future.microtask(() {
  //     state = state.addChildren(childrenIds);
  //   });
  // }

  void addChildrenToId(List<int> childrenIds, int id) async {
    // await Future.microtask(
    //   () {
    state = state.addChildrenToId(childrenIds, id);
    //   },
    // );
  }

  void collapseId(int id) async {
    // await Future.microtask(
    //   () {
    state = state.collapseId(id);
    //   },
    // );
  }
}
