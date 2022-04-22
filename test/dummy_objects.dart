import 'package:hn_client/models/item.dart';
import 'package:hn_client/models/user.dart';

const testJsonStory = {
  "by": "dhouston",
  "descendants": 71,
  "id": 8863,
  "kids": [8952, 9224, 8917, 8884, 8887, 8943, 8869, 8958, 9005],
  "score": 111,
  "time": 1175714200,
  "title": "My YC app: Dropbox - Throw away your USB drive",
  "type": "story",
  "url": "http://www.getdropbox.com/u/2/screencast.html"
};

final testStory = Item(
  id: 8863,
  author: "dhouston",
  descendantCount: 71,
  childrenIds: const [8952, 9224, 8917, 8884, 8887, 8943, 8869, 8958, 9005],
  score: 111,
  title: "My YC app: Dropbox - Throw away your USB drive",
  createdAt: DateTime.fromMillisecondsSinceEpoch(1175714200000, isUtc: true),
  type: ItemType.story,
  url: "http://www.getdropbox.com/u/2/screencast.html",
);

const testJsonComment = {
  "by": "norvig",
  "id": 2921983,
  "kids": [2922097, 2922429, 2924562, 2922709, 2922573],
  "parent": 2921506,
  "text":
      "Aw shucks, guys ... you make me blush with your compliments.<p>Tell you what, Ill make a deal",
  "time": 1314211127,
  "type": "comment"
};

final testComment = Item(
  id: 2921983,
  author: "norvig",
  childrenIds: const [2922097, 2922429, 2924562, 2922709, 2922573],
  body:
      "Aw shucks, guys ... you make me blush with your compliments.<p>Tell you what, Ill make a deal",
  parentId: 2921506,
  createdAt: DateTime.fromMillisecondsSinceEpoch(1314211127000, isUtc: true),
  type: ItemType.comment,
);

const testJsonAsk = {
  "by": "tel",
  "descendants": 16,
  "id": 121003,
  "kids": [121016, 121109, 121168],
  "score": 25,
  "text":
      "<i>or</i> HN: the Next Iteration<p>I get the impression that with Arc",
  "time": 1203647620,
  "title": "Ask HN: The Arc Effect",
  "type": "story"
};

final testAsk = Item(
  id: 121003,
  author: "tel",
  createdAt: DateTime.fromMillisecondsSinceEpoch(1203647620000, isUtc: true),
  type: ItemType.story,
  body: "<i>or</i> HN: the Next Iteration<p>I get the impression that with Arc",
  title: "Ask HN: The Arc Effect",
  score: 25,
  childrenIds: const [121016, 121109, 121168],
  descendantCount: 16,
);

const testJsonJob = {
  "by": "justin",
  "id": 192327,
  "score": 6,
  "text":
      "Justin.tv is the biggest live video site online. We serve hundreds of thousands of video streams a day",
  "time": 1210981217,
  "title": "Justin.tv is looking for a Lead Flash Engineer!",
  "type": "job",
  "url": ""
};

final testJob = Item(
  id: 192327,
  author: "justin",
  createdAt:
      DateTime.fromMillisecondsSinceEpoch(1210981217 * 1000, isUtc: true),
  type: ItemType.job,
  title: "Justin.tv is looking for a Lead Flash Engineer!",
  url: "",
  body:
      "Justin.tv is the biggest live video site online. We serve hundreds of thousands of video streams a day",
  score: 6,
);

const testJsonPoll = {
  "by": "pg",
  "descendants": 54,
  "id": 126809,
  "kids": [126822, 126823, 126993, 126824, 126934],
  "parts": [126810, 126811, 126812],
  "score": 46,
  "text": "",
  "time": 1204403652,
  "title": "Poll: What would happen if News.YC had explicit support for polls?",
  "type": "poll",
};

final testPoll = Item(
  id: 126809,
  author: "pg",
  createdAt:
      DateTime.fromMillisecondsSinceEpoch(1204403652 * 1000, isUtc: true),
  type: ItemType.poll,
  childrenIds: const [126822, 126823, 126993, 126824, 126934],
  body: "",
  pollOptIds: const [126810, 126811, 126812],
  score: 46,
  title: "Poll: What would happen if News.YC had explicit support for polls?",
  descendantCount: 54,
);

const testJsonPollOpt = {
  "by": "pg",
  "id": 160705,
  "poll": 160704,
  "score": 335,
  "text": "Yes, ban them; I'm tired of seeing Valleywag stories on News.YC.",
  "time": 1207886576,
  "type": "pollopt"
};

final testPollOpt = Item(
  id: 160705,
  author: "pg",
  createdAt:
      DateTime.fromMillisecondsSinceEpoch(1207886576 * 1000, isUtc: true),
  pollId: 160704,
  score: 335,
  body: "Yes, ban them; I'm tired of seeing Valleywag stories on News.YC.",
  type: ItemType.pollopt,
);

const testJsonUser = {
  "about": "This is a test",
  "created": 1173923446,
  "delay": 0,
  "id": "jl",
  "karma": 2937,
  "submitted": [8265435, 8168423, 8090946]
};

final testUser = User(
  id: "jl",
  createdAt:
      DateTime.fromMillisecondsSinceEpoch(1173923446 * 1000, isUtc: true),
  karma: 2937,
  about: "This is a test",
  submission: const [8265435, 8168423, 8090946],
);
