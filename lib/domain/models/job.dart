import 'package:equatable/equatable.dart';

import 'item.dart';

class Job extends Item with EquatableMixin {
  final String title, body;
  final int score;
  final String url;

  Job({
    required int id,
    required bool isDeleted,
    required String author,
    required DateTime createdAt,
    required bool isDead,
    required this.body,
    required this.title,
    required this.url,
    required this.score,
  }) : super(
          id: id,
          isDeleted: isDeleted,
          author: author,
          createdAt: createdAt,
          isDead: isDead,
        );

  @override
  List<Object?> get props =>
      [id, isDeleted, author, createdAt, isDead, body, title, url, score];
}
