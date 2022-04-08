import 'package:equatable/equatable.dart';

import 'item.dart';

class Comment extends Item with EquatableMixin {
  final String body;
  final List<int> childrenIds;
  final int parentId;

  final String title;
  final String url;

  Comment({
    required int id,
    required bool isDeleted,
    required String author,
    required DateTime createdAt,
    required bool isDead,
    required this.body,
    required this.parentId,
    required this.childrenIds,
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
        title,
        url,
        parentId,
        childrenIds
      ];
}
