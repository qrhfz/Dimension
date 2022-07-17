import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_item.freezed.dart';
part 'search_item.g.dart';

@freezed
class SearchItem with _$SearchItem {
  const SearchItem._();
  factory SearchItem({
    @JsonKey(name: "objectID", fromJson: int.parse) required int id,
    @JsonKey(name: "author", defaultValue: "") required String author,
    // -----
    @JsonKey(name: "created_at", fromJson: DateTime.parse)
        required DateTime createdAt,
    // -----
    String? title,
    String? url,
    @JsonKey(name: "points") int? score,
  }) = _SearchItem;

  factory SearchItem.fromJson(Map<String, dynamic> json) =>
      _$SearchItemFromJson(json);
}
