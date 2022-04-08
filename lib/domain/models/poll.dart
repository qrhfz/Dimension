import 'package:equatable/equatable.dart';

import 'item.dart';

class Poll extends Item with EquatableMixin {
  final List<int> childrenIds;
  final List<int> pollOptIds;
  final String body;
  final String title;
  final int score;

  Poll({
    required int id,
    required bool isDeleted,
    required String author,
    required DateTime createdAt,
    required bool isDead,
    required this.childrenIds,
    required this.pollOptIds,
    required this.body,
    required this.title,
    required this.score,
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
        childrenIds,
        pollOptIds,
        body,
        title,
        score
      ];
}
