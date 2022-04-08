import 'package:equatable/equatable.dart';
import 'package:hn_client/domain/models/item.dart';

class PollOption extends Item with EquatableMixin {
  final String text;
  final int score;
  final int pollId;
  PollOption({
    required int id,
    required bool isDeleted,
    required String author,
    required DateTime createdAt,
    required bool isDead,
    required this.text,
    required this.score,
    required this.pollId,
  }) : super(
          id: id,
          isDeleted: isDeleted,
          author: author,
          createdAt: createdAt,
          isDead: isDead,
        );

  @override
  List<Object?> get props =>
      [id, isDeleted, author, createdAt, isDead, text, score, pollId];
}
