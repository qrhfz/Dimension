import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

const emptyIList = IListConst<TreeIdItem>([]);

class TreeIdItem extends Equatable {
  final int id;
  final IList<TreeIdItem> children;
  final bool collapsed;

  const TreeIdItem(this.id,
      [this.children = emptyIList, this.collapsed = false]);

  TreeIdItem addChildren(List<int> childrenIds) {
    // if duplicate id found then return
    for (final item in children) {
      final id = item.id;
      if (childrenIds.contains(id)) {
        return this;
      }
    }
    final List<TreeIdItem> childrenNode = children.toList();

    for (final x in childrenIds) {
      childrenNode.add(TreeIdItem(x));
    }

    return copy(children: childrenNode.toIList());
  }

  TreeIdItem addChildrenToId(List<int> childrenIds, int inputId) {
    if (id == inputId) {
      return addChildren(childrenIds);
    }
    List<TreeIdItem> _children = [];
    for (final item in children) {
      _children.add(item.addChildrenToId(childrenIds, inputId));
    }

    return copy(children: _children.toIList());
  }

  IList<ListIdItem> flatten([int level = 0]) {
    if (collapsed) {
      return IList([ListIdItem(id, level, collapsed)]);
    }

    final List<ListIdItem> items = [];

    for (var item in children) {
      final innerItems = item.flatten(level + 1);
      for (var itemX in innerItems) {
        items.add(itemX);
      }
    }

    return IList([ListIdItem(id, level), ...items]);
  }

  TreeIdItem collapseId(int inputId) {
    if (id == inputId) {
      return copy(collapsed: !collapsed);
    }
    final List<TreeIdItem> _children = [];
    for (var item in children) {
      _children.add(item.collapseId(inputId));
    }
    return copy(children: _children.toIList());
  }

  TreeIdItem copy({int? id, IList<TreeIdItem>? children, bool? collapsed}) {
    return TreeIdItem(
      id ?? this.id,
      children ?? this.children,
      collapsed ?? this.collapsed,
    );
  }

  @override
  List<Object?> get props => [id, children, collapsed];
}

class ListIdItem extends Equatable {
  final int id;
  final int level;
  final bool collapsed;

  const ListIdItem(this.id, [this.level = 0, this.collapsed = false]);

  @override
  List<Object?> get props => [id, level];
}
