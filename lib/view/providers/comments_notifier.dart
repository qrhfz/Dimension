import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/item.dart';

final commentsNotifierProvider =
    StateNotifierProvider<CommentsNotifier, List<Node>>(
        (ref) => CommentsNotifier());

class CommentsNotifier extends StateNotifier<List<Node>> {
  CommentsNotifier() : super([]);
  late int rootID;

  void addNode(Node node) async {
    await Future.delayed(Duration.zero, () async {
      final set = {...state}..add(node);

      state = set.toList();
    });
  }

  void seed(Item item) {
    state =
        List<Node>.from(item.childrenIds?.map((e) => Node(e, item.id)) ?? []);
  }
}

extension NodeTools on List<Node> {
  Node getNode(int id) {
    return firstWhere(
      (element) => element.id == id,
      orElse: () => Node(-1, -1),
    );
  }

  List<Node> getChildren(int id) {
    return where((element) => element.parent == id).toList();
  }

  List<IndentedNode> sortIndent(int rootID, [int indent = 0]) {
    final list = [
      for (var item in getChildren(rootID)) ...sortIndent(item.id, indent + 1)
    ];

    final first = getNode(rootID).giveIndent(indent);

    if (first.id != -1) {
      list.insert(0, first);
    }

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
