import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/item.dart';

final commentsNotifierProvider =
    StateNotifierProvider.family<CommentsNotifier, CommentList, int>(
        (ref, id) => CommentsNotifier(id));

class CommentsNotifier extends StateNotifier<CommentList> {
  CommentsNotifier(this.parentID) : super(CommentList([]));

  final int parentID;

  void addNode(Node node) {
    if (!mounted) return;
    final nodes = [...state.nodes];
    if (nodes.isEmpty) {
      state = CommentList({...nodes..add(node)}.toList());

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

    state = CommentList({...nodes}.toList());
  }

  void toggleHide(int id) {
    final index = state.nodes.indexWhere((element) => element.id == id);
    if (index == -1) return;
    final nodes = [...state.nodes];
    nodes[index] = nodes[index].copy(hidden: !nodes[index].hidden);
    state = CommentList(nodes);
  }

  void seed(Item item) {
    if (item.childrenIds == null) return;
    for (var e in item.childrenIds!) {
      scheduleMicrotask(() {
        addNode(Node(id: e, parent: item.id));
      });
    }
  }
}

class CommentList extends Equatable {
  final List<Node> nodes;
  late final List<Node> masked;

  CommentList(this.nodes) {
    masked = nodes.mask;
  }
  @override
  List<Object?> get props => throw UnimplementedError();
}

extension NodeListTools on List<Node> {
  List<Node> get mask {
    final nodes = <Node>[];

    Node? hiddenNode;

    for (var i = 0; i < length; i++) {
      final node = this[i];

      if (node.parent == hiddenNode?.parent) {
        hiddenNode = null;
      }

      // descendant of hidden node
      if (node.indent > (hiddenNode?.indent ?? 99)) {
        continue;
      }

      if (node.hidden) {
        hiddenNode = node;
      }

      nodes.add(node);
    }

    return nodes;
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
  List<Object?> get props => [id, parent];
}
