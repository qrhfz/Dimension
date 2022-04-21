import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final DateTime createdAt;
  final int karma;
  final String? about;
  final List<int> submission;

  const User(
      {required this.id,
      required this.createdAt,
      required this.karma,
      required this.about,
      required this.submission});

  @override
  List<Object?> get props => [id, createdAt, karma, about, submission];
}
