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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        json["created"] * 1000,
        isUtc: true,
      ),
      karma: json["karma"],
      about: json["about"],
      submission: json["submitted"],
    );
  }

  @override
  List<Object?> get props => [id, createdAt, karma, about, submission];
}
