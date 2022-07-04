import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

const emptyIList = IListConst<ItemIdTree>([]);

class ItemIdTree extends Equatable {
  final int id;
  final IList<ItemIdTree> _children;
  final bool collapsed;

  List<ItemIdTree> get children => _children.toList();

  const ItemIdTree(this.id,
      [this._children = emptyIList, this.collapsed = false]);

  ItemIdTree addChildren(List<int> childrenIds) {
    final currentChildrenIds = _children.map((element) => element.id);
    for (var x in childrenIds) {
      if (currentChildrenIds.contains(x)) {
        return this;
      }
    }

    final list = childrenIds.map((e) => ItemIdTree(e)).toList();
    final x = {...children, ...list}.toIList();

    return copy(children: x);
  }

  ItemIdTree addChildrenToId(List<int> childrenIds, int inputId) {
    if (id == inputId) {
      return addChildren(childrenIds);
    }
    final x =
        children.map((e) => e.addChildrenToId(childrenIds, inputId)).toIList();
    return copy(children: x);
  }

  List<ItemId> flatten([int level = 0]) {
    final out = [ItemId(id, level)];

    if (collapsed) return out;

    for (final item in children) {
      out.addAll(item.flatten(level + 1));
    }
    return out;
  }

  ItemIdTree collapseId(int inputId) {
    if (id == inputId) {
      return copy(collapsed: !collapsed);
    }
    final x = children.map((e) => e.collapseId(inputId)).toIList();
    return copy(children: x);
  }

  ItemIdTree copy({int? id, IList<ItemIdTree>? children, bool? collapsed}) {
    return ItemIdTree(
        id ?? this.id, children ?? _children, collapsed ?? this.collapsed);
  }

  @override
  List<Object?> get props => [id, children, collapsed];
}

class ItemId extends Equatable {
  final int id;
  final int level;

  const ItemId(this.id, [this.level = 0]);

  @override
  List<Object?> get props => [id, level];
}
