import 'package:dimension/common/extract_thread_id.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("given a valid link returns an id of type int", () {
    final int? id =
        extractThreadId("https://news.ycombinator.com/item?id=33062606");

    assert(id == 33062606);
  });
}
