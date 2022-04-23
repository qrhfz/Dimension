import 'package:flutter_test/flutter_test.dart';
import 'package:hn_client/view/providers/comments_notifier.dart';

void main() {
  const list = <Node>[
    Node(1, 0),
    Node(2, 1),
    Node(3, 1),
    Node(4, 2),
  ];

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
