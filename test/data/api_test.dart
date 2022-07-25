import 'package:flutter/foundation.dart';
import "package:flutter_test/flutter_test.dart";
import '/data/api.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../dummy_objects.dart';
import 'api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient client;
  late API api;

  setUp(() {
    client = MockClient();
    api = API(client);
  });

  test("getNewStoryIds", () async {
    when(client.get(Uri.https(API.authority, '/v0/newstories')))
        .thenAnswer((_) async => http.Response('[1,2,3]', 200));
    final ids = await api.getNewStoryIds();
    assert(listEquals(ids, [1, 2, 3]));
  });
  test("getTopStoryIds", () {});
  test("getBestStoryIds", () {});

  test("getAskStoryIds", () {});

  test("getShowStoryIds", () {});

  test("getJobStoryIds", () {});

  test("getItem", () async {
    final url = Uri.https('hacker-news.firebaseio.com', '/v0/item/8863.json');

    when(client.get(url)).thenAnswer(
      (_) async => http.Response('''
      {
        "by": "dhouston",
        "descendants": 71,
        "id": 8863,
        "kids": [8952, 9224, 8917, 8884, 8887, 8943, 8869, 8958, 9005],
        "score": 111,
        "time": 1175714200,
        "title": "My YC app: Dropbox - Throw away your USB drive",
        "type": "story",
        "url": "http://www.getdropbox.com/u/2/screencast.html"
      }
      ''', 200),
    );

    final result = await api.getItem(8863);
    expect(result, testStory);
  });

  test("getUser", () {});
}
