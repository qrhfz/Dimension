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

    int? index;

    for (var i = parentIndex + 1; i < nodes.length; i++) {
      final current = nodes[i];
      if (current.parent == node.parent) {
        continue;
      } else {
        index = i;
        break;
      }
    }

    final indent = parentIndex == -1 ? 0 : nodes[parentIndex].indent + 1;

    if (index != null) {
      nodes.insert(
        index,
        node.changeIndent(indent),
      );
    } else {
      nodes.add(node.changeIndent(indent));
    }

    state = nodes;
  }

  void seed(Item item) {
    if (item.childrenIds == null) return;
    for (var e in item.childrenIds!) {
      addNode(Node(e, item.id));
    }
  }
}

class Node extends Equatable {
  final int id, parent, indent;

  const Node(this.id, this.parent, [this.indent = 0]);

  Node changeIndent(int indent) => Node(id, parent, indent);

  @override
  List<Object?> get props => [id, parent, indent];
}
