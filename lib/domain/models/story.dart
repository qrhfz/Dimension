import 'package:equatable/equatable.dart';

import 'item.dart';

class Story extends Item with EquatableMixin {
  final String body;
  final int descendantCount;
  final List<int> childrenIds;
  final int score;
  final String title;
  final String url;

  Story({
    required int id,
    required bool isDeleted,
    required String author,
    required DateTime createdAt,
    required bool isDead,
    required this.body,
    required this.descendantCount,
    required this.childrenIds,
    required this.score,
    required this.title,
    required this.url,
  }) : super(
          id: id,
          isDeleted: isDeleted,
          author: author,
          createdAt: createdAt,
          isDead: isDead,
        );

  @override
  List<Object?> get props => [
        id,
        isDeleted,
        author,
        createdAt,
        isDead,
        body,
        descendantCount,
        childrenIds,
        score,
        title,
        url
      ];
}
