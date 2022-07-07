import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

const emptyIList = IListConst<ItemIdTree>([]);

class ItemIdTree extends Equatable {
  final int id;
  final IList<ItemIdTree> children;
  final bool collapsed;

  const ItemIdTree(this.id,
      [this.children = emptyIList, this.collapsed = false]);

  ItemIdTree addChildren(List<int> childrenIds) {
    // if duplicate id found then return
    for (final item in children) {
      final id = item.id;
      if (childrenIds.contains(id)) {
        return this;
      }
    }
    final List<ItemIdTree> childrenNode = children.toList();

    for (final x in childrenIds) {
      childrenNode.add(ItemIdTree(x));
    }

    return copy(children: childrenNode.toIList());
  }

  ItemIdTree addChildrenToId(List<int> childrenIds, int inputId) {
    if (id == inputId) {
      return addChildren(childrenIds);
    }
    List<ItemIdTree> _children = [];
    for (final item in children) {
      _children.add(item.addChildrenToId(childrenIds, inputId));
    }

    return copy(children: _children.toIList());
  }

  IList<ItemId> flatten([int level = 0]) {
    if (collapsed) {
      return IList([ItemId(id, level)]);
    }

    final List<ItemId> items = [];

    for (var item in children) {
      final innerItems = item.flatten(level + 1);
      for (var itemX in innerItems) {
        items.add(itemX);
      }
    }

    return IList([ItemId(id, level), ...items]);
  }

  ItemIdTree collapseId(int inputId) {
    if (id == inputId) {
      return copy(collapsed: !collapsed);
    }
    final List<ItemIdTree> _children = [];
    for (var item in children) {
      _children.add(item.collapseId(inputId));
    }
    return copy(children: _children.toIList());
  }

  ItemIdTree copy({int? id, IList<ItemIdTree>? children, bool? collapsed}) {
    return ItemIdTree(
      id ?? this.id,
      children ?? this.children,
      collapsed ?? this.collapsed,
    );
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
