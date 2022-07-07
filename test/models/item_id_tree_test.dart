import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hn_client/models/tree_id_item.dart';

void main() {
  test("ItemIdTree equality test", () {
    const a = TreeIdItem(1, IListConst([TreeIdItem(2)]));
    const b = TreeIdItem(1, IListConst([TreeIdItem(2)]));

    assert(a == b);
  });

  test("add children", () {
    const a = TreeIdItem(1);
    final b = a.addChildren([2]);

    expect(
      b,
      const TreeIdItem(
        1,
        IListConst([
          TreeIdItem(2),
        ]),
      ),
    );

    final c = a.addChildren([2]);

    expect(c, b);

    final d = b.addChildren([3, 4]);
    expect(
      d,
      const TreeIdItem(
        1,
        IListConst([
          TreeIdItem(2),
          TreeIdItem(3),
          TreeIdItem(4),
        ]),
      ),
    );
  });

  test("addChildrenToId", () {
    const a = TreeIdItem(1);
    final b = a.addChildrenToId([2, 3, 4], 1);

    const expectedB = TreeIdItem(
      1,
      IListConst(
        [
          TreeIdItem(2),
          TreeIdItem(3),
          TreeIdItem(4),
        ],
      ),
    );

    expect(b, expectedB);
  });

  test("flatten", () {
    const a = TreeIdItem(
      31986205,
      IListConst([
        TreeIdItem(31986539),
        TreeIdItem(31986485),
        TreeIdItem(31986522),
        TreeIdItem(
          31986361,
          IListConst([
            TreeIdItem(
              31986376,
              IListConst([TreeIdItem(31986437)]),
            ),
            TreeIdItem(31986526),
            TreeIdItem(
              31986369,
              IListConst([TreeIdItem(31986469), TreeIdItem(31986417)]),
            )
          ]),
        ),
        TreeIdItem(
          31986372,
          IListConst([
            TreeIdItem(31986407),
            TreeIdItem(31986387, IListConst([TreeIdItem(31986489)])),
            TreeIdItem(31986392),
            TreeIdItem(31986492)
          ]),
        ),
        TreeIdItem(31986500)
      ]),
      true,
    );

    final b = a.flatten();
    expect(
      b,
      const IListConst([
        ListIdItem(31986205, 0),
        ListIdItem(31986539, 1),
        ListIdItem(31986485, 1),
        ListIdItem(31986522, 1),
        ListIdItem(31986361, 1),
        ListIdItem(31986376, 2),
        ListIdItem(31986437, 3),
        ListIdItem(31986526, 2),
        ListIdItem(31986369, 2),
        ListIdItem(31986469, 3),
        ListIdItem(31986417, 3),
        ListIdItem(31986372, 1),
        ListIdItem(31986407, 2),
        ListIdItem(31986387, 2),
        ListIdItem(31986489, 3),
        ListIdItem(31986392, 2),
        ListIdItem(31986492, 2),
        ListIdItem(31986500, 1),
      ]),
    );
  });
}
