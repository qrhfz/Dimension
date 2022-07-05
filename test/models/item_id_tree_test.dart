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
    final b = a.addChildren([2]);

    expect(
      b,
      const ItemIdTree(
        1,
        IListConst([
          ItemIdTree(2),
        ]),
      ),
    );

    final c = a.addChildren([2]);

    expect(c, b);
  });

  test("addChildrenToId", () {
    const a = ItemIdTree(1);
    final b = a.addChildrenToId([2, 3, 4], 1);

    const expectedB = ItemIdTree(
      1,
      IListConst(
        [
          ItemIdTree(2),
          ItemIdTree(3),
          ItemIdTree(4),
        ],
      ),
    );

    expect(b, expectedB);
  });

  test("flatten", () {
    const a = ItemIdTree(
      31986205,
      IListConst([
        ItemIdTree(31986539),
        ItemIdTree(31986485),
        ItemIdTree(31986522),
        ItemIdTree(
          31986361,
          IListConst([
            ItemIdTree(
              31986376,
              IListConst([ItemIdTree(31986437)]),
            ),
            ItemIdTree(31986526),
            ItemIdTree(
              31986369,
              IListConst([ItemIdTree(31986469), ItemIdTree(31986417)]),
            )
          ]),
        ),
        ItemIdTree(
          31986372,
          IListConst([
            ItemIdTree(31986407),
            ItemIdTree(31986387, IListConst([ItemIdTree(31986489)])),
            ItemIdTree(31986392),
            ItemIdTree(31986492)
          ]),
        ),
        ItemIdTree(31986500)
      ]),
    );

    final b = a.flatten();
    expect(
      b,
      const IListConst([
        ItemId(31986205, 0),
        ItemId(31986539, 1),
        ItemId(31986485, 1),
        ItemId(31986522, 1),
        ItemId(31986361, 1),
        ItemId(31986376, 2),
        ItemId(31986437, 3),
        ItemId(31986526, 2),
        ItemId(31986369, 2),
        ItemId(31986469, 3),
        ItemId(31986417, 3),
        ItemId(31986372, 1),
        ItemId(31986407, 2),
        ItemId(31986387, 2),
        ItemId(31986489, 3),
        ItemId(31986392, 2),
        ItemId(31986492, 2),
        ItemId(31986500, 1),
      ]),
    );
  });
}
