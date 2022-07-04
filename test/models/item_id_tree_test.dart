import 'dart:developer';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hn_client/models/item_id_tree.dart';

void main() {
  test("ItemIdTree equality test", () {
    const a = ItemIdTree(1, IListConst([ItemIdTree(2)]));
    const b = ItemIdTree(1, IListConst([ItemIdTree(2)]));

    assert(a == b);
  });

  test("add children", () {
    const a = ItemIdTree(1);
    final b = a.addChildren([1]);

    expect(b.children.length, 1);
  });

  test("addChildrenToId", () {
    const a = ItemIdTree(1, IListConst([ItemIdTree(2)]));
    final b = a.addChildrenToId([3], 2);
    log(b.toString());
    expect(b.children[0].children.length, 1);
    final c = b.addChildrenToId([4], 3);
    log(c.toString());
  });

  test("flatten", () {});
}
