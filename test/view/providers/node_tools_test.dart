import 'package:flutter_test/flutter_test.dart';
import 'package:hn_client/view/providers/comments_notifier.dart';

void main() {
  final list = {
    const Node(1, 0),
    const Node(2, 1),
    const Node(3, 1),
    const Node(4, 2),
  };

  const indentedList = <IndentedNode>[
    IndentedNode(1, 0, 0),
    IndentedNode(2, 1, 1),
    IndentedNode(4, 2, 2),
    IndentedNode(3, 1, 1),
  ];

  test("test conversion", () {
    final result = list.sortIndent(0);
    indentedList.asMap().forEach((key, value) {
      expect(value.id, result[key].id);
    });
  });
}
