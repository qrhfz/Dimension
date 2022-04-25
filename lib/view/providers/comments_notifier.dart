import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/item.dart';

final commentsNotifierProvider =
    StateNotifierProvider.family<CommentsNotifier, List<IndentedNode>, int>(
        (ref, id) => CommentsNotifier(id));

class CommentsNotifier extends StateNotifier<List<IndentedNode>> {
  CommentsNotifier(this.parentID) : super([]);

  final int parentID;
  final Set<Node> nodes = {};

  Future<void> addNode(Node node) async {
    nodes.add(node);

    scheduleMicrotask(() {
      state = nodes.sortIndent();
    });
  }

  Future<void> seed(Item item) async {
    if (item.childrenIds == null) return;
    final list = item.childrenIds!.map((e) => Node(e, item.id));
    nodes.addAll(list);

    scheduleMicrotask(() {
      state = nodes.sortIndent();
    });
  }
}

extension NodeTools on Set<Node> {
  Node getNode(int id) {
    return firstWhere(
      (element) => element.id == id,
      orElse: () => const Node(-1, -1),
    );
  }

  Set<Node> getChildren(int id) {
    return where((element) => element.parent == id).toSet();
  }

  List<IndentedNode> sortIndent([int? id, int indent = 0]) {
    id ??= first.parent;
    final node = getNode(id).giveIndent(indent);

    final list = [
      if (node.id != -1) node,
      for (var item in getChildren(id)) ...sortIndent(item.id, indent + 1)
    ];

    return list;
  }
}

class Node extends Equatable {
  final int id, parent;

  const Node(this.id, this.parent);

  IndentedNode giveIndent(int indent) => IndentedNode(id, parent, indent);

  @override
  List<Object?> get props => [id, parent];
}

class IndentedNode extends Equatable {
  final int id, parent, indent;

  const IndentedNode(this.id, this.parent, this.indent);

  @override
  List<Object?> get props => [id, parent, indent];
}
