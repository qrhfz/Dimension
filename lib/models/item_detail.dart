import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hn_client/models/item.dart';

part 'item_detail.freezed.dart';
part 'item_detail.g.dart';

@freezed
class ItemDetail with _$ItemDetail implements ItemEntity {
  const ItemDetail._();

  const factory ItemDetail({
    required int id,
    @JsonKey(name: "author", defaultValue: "") required String author,
    // -----
    @JsonKey(name: "created_at", fromJson: DateTime.parse)
        required DateTime createdAt,
    // -----
    String? title,
    @JsonKey(name: "text") String? body,
    @JsonKey(name: "children") List<ItemDetail>? children,
    // @JsonKey(name: "parts") List<int>? pollOptIds,
    @JsonKey(name: "parent_id") int? parentId,
    @JsonKey(name: "story_id") int? storyId,
    String? url,
    @JsonKey(name: "points") int? score,
    @Default(false) bool collapsed,
    // @JsonKey(name: "descendants") int? descendantCount,
  }) = _ItemDetail;

  factory ItemDetail.fromJson(Map<String, dynamic> json) =>
      _$ItemDetailFromJson(json);

  String get bodyData {
    return body ?? "";
  }

  IList<FlatItemDetail> flatten([int level = 0]) {
    if (this.children == null || collapsed) {
      return IList([toFlat(level)]);
    }
    final List<FlatItemDetail> children = [];

    for (var item in this.children!) {
      children.addAll(item.flatten(level + 1));
    }
    return IList([toFlat(level), ...children]);
  }

  FlatItemDetail toFlat([int level = 0]) {
    return FlatItemDetail(
      id: id,
      author: author,
      createdAt: createdAt,
      title: title,
      body: body,
      level: level,
      parentId: parentId,
      storyId: storyId,
      url: url,
      score: score,
      collapsed: collapsed,
    );
  }

  ItemDetail collapse(int id) {
    if (this.id == id) {
      return copyWith(collapsed: !collapsed);
    }

    return copyWith(children: children?.map((e) => e.collapse(id)).toList());
  }

  @override
  int? get descendantCount => null;
}

@freezed
class FlatItemDetail with _$FlatItemDetail {
  const FlatItemDetail._();

  const factory FlatItemDetail({
    required int id,
    required String author,
    // -----

    required DateTime createdAt,
    // -----
    String? title,
    String? body,
    int? parentId,
    int? storyId,
    String? url,
    int? score,
    @Default(0) int level,
    @Default(false) bool collapsed,
  }) = _FlatItemDetail;

  String get bodyData {
    return body ?? "";
  }
}
