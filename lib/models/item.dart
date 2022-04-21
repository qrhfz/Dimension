import 'package:equatable/equatable.dart';

enum ItemType { job, story, comment, poll, pollopt }

class Item extends Equatable {
  final int id;
  final bool isDeleted;
  final String author;
  final DateTime createdAt;
  final bool isDead;
  final ItemType type;

  final int? pollId;
  final String? title, body;
  final List<int>? childrenIds;
  final List<int>? pollOptIds;
  final int? parentId;
  final String? url;
  final int? score;
  final int? descendantCount;

  const Item({
    required this.id,
    required this.author,
    required this.createdAt,
    required this.type,
    this.isDeleted = false,
    this.isDead = false,
    this.pollId,
    this.title,
    this.body,
    this.childrenIds,
    this.pollOptIds,
    this.parentId,
    this.url,
    this.score,
    this.descendantCount,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json["id"],
      isDeleted: json["deleted"] ?? false,
      author: json["by"],
      createdAt:
          DateTime.fromMillisecondsSinceEpoch(json["time"] * 1000, isUtc: true),
      body: json["text"],
      isDead: json["dead"] ?? false,
      parentId: json["parent"],
      pollId: json["poll"],
      childrenIds: json["kids"],
      url: json["url"],
      score: json["score"],
      title: json["title"],
      pollOptIds: json["parts"],
      descendantCount: json["descendants"],
      type: _itemTypeMap[json["type"]]!,
    );
  }

  @override
  List<Object?> get props => [
        id,
        isDeleted,
        author,
        createdAt,
        isDead,
        type,
        pollId,
        title,
        body,
        childrenIds,
        pollOptIds,
        parentId,
        url,
        score,
        descendantCount,
      ];

  static const Map<String, ItemType> _itemTypeMap = {
    "job": ItemType.job,
    "story": ItemType.story,
    "comment": ItemType.comment,
    "poll": ItemType.poll,
    "pollopt": ItemType.pollopt
  };
}
