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

  void addNode(Node node) {
    if (state.contains(node)) return;

    final nodes = [...state];
    if (nodes.isEmpty) {
      state = nodes..add(node.giveIndent(1));

      return;
    }

    final parentIndex =
        nodes.indexWhere((element) => element.id == node.parent);

    int? index;

    for (var i = parentIndex + 1; i < nodes.length; i++) {
      final current = nodes[i];
      if (current.id == node.parent) {
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
        node.giveIndent(indent),
      );
    }

    state = nodes;
  }

  Future<void> seed(Item item) async {
    if (item.childrenIds == null) return;
    for (var e in item.childrenIds!) {
      addNode(Node(e, item.id));
    }
  }
}

// extension NodeTools on Set<Node> {
//   Node getNode(int id) {
//     return firstWhere(
//       (element) => element.id == id,
//       orElse: () => const Node(-1, -1),
//     );
//   }

//   Set<Node> getChildren(int id) {
//     return where((element) => element.parent == id).toSet();
//   }

//   List<IndentedNode> sortIndent([int? id, int indent = 0]) {
//     id ??= first.parent;
//     final node = getNode(id).giveIndent(indent);

//     final list = [
//       if (node.id != -1) node,
//       for (var item in getChildren(id)) ...sortIndent(item.id, indent + 1)
//     ];

//     return list;
//   }
// }

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
