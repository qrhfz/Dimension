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
    required this.isDeleted,
    required this.author,
    required this.createdAt,
    required this.isDead,
    required this.type,
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
}
