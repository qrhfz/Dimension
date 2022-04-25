import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/item.dart';

final commentsNotifierProvider =
    StateNotifierProvider.family<CommentsNotifier, List<Node>, int>(
        (ref, id) => CommentsNotifier(id));

class CommentsNotifier extends StateNotifier<List<Node>> {
  CommentsNotifier(this.parentID) : super([]);

  final int parentID;

  void addNode(Node node) {
    if (state.contains(node)) return;

    final nodes = [...state];
    if (nodes.isEmpty) {
      state = nodes..add(node);

      return;
    }

    final parentIndex =
        nodes.indexWhere((element) => element.id == node.parent);

    int index = parentIndex + 1;

    while (index < nodes.length) {
      final current = nodes[index];
      if (current.parent == node.parent) {
        index++;
        continue;
      } else {
        break;
      }
    }

    final indent = parentIndex == -1 ? 0 : nodes[parentIndex].indent + 1;

    nodes.insert(
      index,
      node.copy(indent: indent),
    );

    state = nodes;
  }

  void toggleHide(int id) {
    final index = state.indexWhere((element) => element.id == id);
    if (index == -1) return;
    var node = state[index];
    node = node.copy(hidden: !node.hidden);
    final nodes = [...state];
    nodes.removeAt(index);
    nodes.insert(index, node);
    state = nodes;
  }

  void seed(Item item) {
    if (item.childrenIds == null) return;
    for (var e in item.childrenIds!) {
      addNode(Node(id: e, parent: item.id));
    }
  }
}

extension NodeListTools on List<Node> {
  List<Node> get mask {
    return [
      for (final node in this)
        if (!isAncestorHiding(node.id)) node
    ];
  }

  // bool _isParentExist(int id) {
  //   return contains(firstWhere(
  //     (element) => element.id == id,
  //     orElse: () => Node.faux,
  //   ));
  // }

  bool? isParentHiding(int id) {
    final parent = firstWhere(
      (el) => el.id == getById(id)?.parent,
      orElse: () => Node.faux,
    );

    if (parent == Node.faux) {
      return null;
    }
    return parent.hidden;
  }

  bool isAncestorHiding(int id) {
    final parentHiding = isParentHiding(id);
    final parent = getParentById(id);
    if (parentHiding == null) {
      return false;
    } else {
      return parentHiding ? true : isAncestorHiding(parent!.id);
    }
  }

  Node? getById(int id) {
    Node node = firstWhere(
      (element) => element.id == id,
      orElse: () => Node.faux,
    );
    if (node == Node.faux) return null;
    return node;
  }

  Node? getParentById(int id) {
    Node node = firstWhere(
      (element) => element.id == getById(id)?.parent,
      orElse: () => Node.faux,
    );
    if (node == Node.faux) return null;
    return node;
  }
}

class Node extends Equatable {
  final int id, parent, indent;
  final bool hidden;

  const Node({
    required this.id,
    required this.parent,
    this.indent = 0,
    this.hidden = false,
  });

  Node copy({int? id, int? parent, int? indent, bool? hidden}) {
    return Node(
      id: id ?? this.id,
      parent: parent ?? this.parent,
      indent: indent ?? this.indent,
      hidden: hidden ?? this.hidden,
    );
  }

  static Node get faux => const Node(id: -1, parent: -1);

  @override
  List<Object?> get props => [id, parent, indent, hidden];
}
