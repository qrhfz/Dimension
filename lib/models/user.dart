import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/time_converter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    @JsonKey(
      name: "created",
      fromJson: secondsFromEpochToDateTime,
    )
        required DateTime createdAt,
    required int karma,
    required String? about,
    @JsonKey(name: "submitted")
        required List<int> submission,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
