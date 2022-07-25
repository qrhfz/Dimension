import 'package:freezed_annotation/freezed_annotation.dart';
import '/common/time_converter.dart';

part 'item.freezed.dart';
part 'item.g.dart';

enum ItemType {
  @JsonValue('job')
  job,
  @JsonValue('story')
  story,
  @JsonValue('comment')
  comment,
  @JsonValue('poll')
  poll,
  @JsonValue('pollopt')
  pollopt
}

@freezed
class Item with _$Item {
  const Item._();

  const factory Item({
    required int id,
    @JsonKey(name: "by", defaultValue: "") required String author,
    // -----
    @JsonKey(name: "time", fromJson: secondsFromEpochToDateTime)
        required DateTime createdAt,
    // -----
    required ItemType type,
    @JsonKey(name: "deleted") bool? isDeleted,
    @JsonKey(name: "dead") bool? isDead,
    @JsonKey(name: "poll") int? pollId,
    String? title,
    @JsonKey(name: "text") String? body,
    @JsonKey(name: "kids") List<int>? childrenIds,
    @JsonKey(name: "parts") List<int>? pollOptIds,
    @JsonKey(name: "parent") int? parentId,
    String? url,
    int? score,
    @JsonKey(name: "descendants") int? descendantCount,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  String get bodyData {
    return body ?? "";
  }
}
