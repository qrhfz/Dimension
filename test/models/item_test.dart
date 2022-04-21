import 'package:flutter_test/flutter_test.dart';
import 'package:hn_client/models/item.dart';

import '../dummy_objects.dart';

void main() {
  test("Equality test", () {
    final a = Item(
        id: 1,
        isDeleted: false,
        author: "a",
        createdAt: DateTime(2022, 1, 1),
        isDead: false,
        type: ItemType.comment);
    final b = Item(
        id: 1,
        isDeleted: false,
        author: "a",
        createdAt: DateTime(2022, 1, 1),
        isDead: false,
        type: ItemType.comment);

    expect(a, b);
  });
  test("Given Map object fromJson return Item object", () {
    final Item actualStory = Item.fromJson(testJsonStory);
    expect(actualStory, testStory);

    final Item actualComment = Item.fromJson(testJsonComment);
    expect(actualComment, testComment);

    final Item actualAsk = Item.fromJson(testJsonAsk);
    expect(actualAsk, testAsk);

    final Item actualJob = Item.fromJson(testJsonJob);
    expect(actualJob, testJob);

    final Item actualPoll = Item.fromJson(testJsonPoll);
    expect(actualPoll, testPoll);

    final Item actualPollOpt = Item.fromJson(testJsonPollOpt);
    expect(actualPollOpt, testPollOpt);
  });
  test("Given Item object toJson return Map object", () {});
}
