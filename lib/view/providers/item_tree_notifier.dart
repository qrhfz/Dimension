import 'dart:developer';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/models/tree_id_item.dart';
import 'package:hn_client/view/providers/item_notifier.dart';

// import '../../models/item.dart';

final itemTreeFamily =
    StateNotifierProvider.family<ItemTreeNotifier, IList<ListIdItem>, int>(
        (ref, id) {
  final item = ref.watch(itemFamily(id));
  final tree = item.maybeWhen(
    data: (item) {
      final ids = item.childrenIds;
      if (ids == null) {
        return TreeIdItem(item.id);
      }
      final List<TreeIdItem> children = [];

      for (var id in ids) {
        children.add(TreeIdItem(id));
      }

      return TreeIdItem(item.id, children.toIList());
    },
    orElse: () => TreeIdItem(id),
  );
  return ItemTreeNotifier(tree);
});

class ItemTreeNotifier extends StateNotifier<IList<ListIdItem>> {
  ItemTreeNotifier(this.tree) : super(tree.flatten());

  TreeIdItem tree;

  void addChildrenToId(List<int> childrenIds, int id) async {
    tree = tree.addChildrenToId(childrenIds, id);
    state = tree.flatten().sublist(1);
  }

  void collapseId(int id) async {
    tree = tree.collapseId(id);
    state = tree.flatten().sublist(1);
  }
}
