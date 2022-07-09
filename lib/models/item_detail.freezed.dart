// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemDetail _$ItemDetailFromJson(Map<String, dynamic> json) {
  return _ItemDetail.fromJson(json);
}

/// @nodoc
mixin _$ItemDetail {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "author", defaultValue: "")
  String get author => throw _privateConstructorUsedError; // -----
  @JsonKey(name: "created_at", fromJson: DateTime.parse)
  DateTime get createdAt => throw _privateConstructorUsedError; // -----
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "text")
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: "children")
  List<ItemDetail>? get children =>
      throw _privateConstructorUsedError; // @JsonKey(name: "parts") List<int>? pollOptIds,
  @JsonKey(name: "parent_id")
  int? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: "story_id")
  int? get storyId => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: "points")
  int? get score => throw _privateConstructorUsedError;
  bool get collapsed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemDetailCopyWith<ItemDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDetailCopyWith<$Res> {
  factory $ItemDetailCopyWith(
          ItemDetail value, $Res Function(ItemDetail) then) =
      _$ItemDetailCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: "author", defaultValue: "") String author,
      @JsonKey(name: "created_at", fromJson: DateTime.parse) DateTime createdAt,
      String? title,
      @JsonKey(name: "text") String? body,
      @JsonKey(name: "children") List<ItemDetail>? children,
      @JsonKey(name: "parent_id") int? parentId,
      @JsonKey(name: "story_id") int? storyId,
      String? url,
      @JsonKey(name: "points") int? score,
      bool collapsed});
}

/// @nodoc
class _$ItemDetailCopyWithImpl<$Res> implements $ItemDetailCopyWith<$Res> {
  _$ItemDetailCopyWithImpl(this._value, this._then);

  final ItemDetail _value;
  // ignore: unused_field
  final $Res Function(ItemDetail) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? createdAt = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? children = freezed,
    Object? parentId = freezed,
    Object? storyId = freezed,
    Object? url = freezed,
    Object? score = freezed,
    Object? collapsed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ItemDetail>?,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      storyId: storyId == freezed
          ? _value.storyId
          : storyId // ignore: cast_nullable_to_non_nullable
              as int?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      collapsed: collapsed == freezed
          ? _value.collapsed
          : collapsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ItemDetailCopyWith<$Res>
    implements $ItemDetailCopyWith<$Res> {
  factory _$$_ItemDetailCopyWith(
          _$_ItemDetail value, $Res Function(_$_ItemDetail) then) =
      __$$_ItemDetailCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: "author", defaultValue: "") String author,
      @JsonKey(name: "created_at", fromJson: DateTime.parse) DateTime createdAt,
      String? title,
      @JsonKey(name: "text") String? body,
      @JsonKey(name: "children") List<ItemDetail>? children,
      @JsonKey(name: "parent_id") int? parentId,
      @JsonKey(name: "story_id") int? storyId,
      String? url,
      @JsonKey(name: "points") int? score,
      bool collapsed});
}

/// @nodoc
class __$$_ItemDetailCopyWithImpl<$Res> extends _$ItemDetailCopyWithImpl<$Res>
    implements _$$_ItemDetailCopyWith<$Res> {
  __$$_ItemDetailCopyWithImpl(
      _$_ItemDetail _value, $Res Function(_$_ItemDetail) _then)
      : super(_value, (v) => _then(v as _$_ItemDetail));

  @override
  _$_ItemDetail get _value => super._value as _$_ItemDetail;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? createdAt = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? children = freezed,
    Object? parentId = freezed,
    Object? storyId = freezed,
    Object? url = freezed,
    Object? score = freezed,
    Object? collapsed = freezed,
  }) {
    return _then(_$_ItemDetail(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      children: children == freezed
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ItemDetail>?,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      storyId: storyId == freezed
          ? _value.storyId
          : storyId // ignore: cast_nullable_to_non_nullable
              as int?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      collapsed: collapsed == freezed
          ? _value.collapsed
          : collapsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemDetail extends _ItemDetail {
  const _$_ItemDetail(
      {required this.id,
      @JsonKey(name: "author", defaultValue: "")
          required this.author,
      @JsonKey(name: "created_at", fromJson: DateTime.parse)
          required this.createdAt,
      this.title,
      @JsonKey(name: "text")
          this.body,
      @JsonKey(name: "children")
          final List<ItemDetail>? children,
      @JsonKey(name: "parent_id")
          this.parentId,
      @JsonKey(name: "story_id")
          this.storyId,
      this.url,
      @JsonKey(name: "points")
          this.score,
      this.collapsed = false})
      : _children = children,
        super._();

  factory _$_ItemDetail.fromJson(Map<String, dynamic> json) =>
      _$$_ItemDetailFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "author", defaultValue: "")
  final String author;
// -----
  @override
  @JsonKey(name: "created_at", fromJson: DateTime.parse)
  final DateTime createdAt;
// -----
  @override
  final String? title;
  @override
  @JsonKey(name: "text")
  final String? body;
  final List<ItemDetail>? _children;
  @override
  @JsonKey(name: "children")
  List<ItemDetail>? get children {
    final value = _children;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// @JsonKey(name: "parts") List<int>? pollOptIds,
  @override
  @JsonKey(name: "parent_id")
  final int? parentId;
  @override
  @JsonKey(name: "story_id")
  final int? storyId;
  @override
  final String? url;
  @override
  @JsonKey(name: "points")
  final int? score;
  @override
  @JsonKey()
  final bool collapsed;

  @override
  String toString() {
    return 'ItemDetail(id: $id, author: $author, createdAt: $createdAt, title: $title, body: $body, children: $children, parentId: $parentId, storyId: $storyId, url: $url, score: $score, collapsed: $collapsed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemDetail &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            const DeepCollectionEquality().equals(other.parentId, parentId) &&
            const DeepCollectionEquality().equals(other.storyId, storyId) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality().equals(other.collapsed, collapsed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(_children),
      const DeepCollectionEquality().hash(parentId),
      const DeepCollectionEquality().hash(storyId),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(score),
      const DeepCollectionEquality().hash(collapsed));

  @JsonKey(ignore: true)
  @override
  _$$_ItemDetailCopyWith<_$_ItemDetail> get copyWith =>
      __$$_ItemDetailCopyWithImpl<_$_ItemDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemDetailToJson(this);
  }
}

abstract class _ItemDetail extends ItemDetail {
  const factory _ItemDetail(
      {required final int id,
      @JsonKey(name: "author", defaultValue: "")
          required final String author,
      @JsonKey(name: "created_at", fromJson: DateTime.parse)
          required final DateTime createdAt,
      final String? title,
      @JsonKey(name: "text")
          final String? body,
      @JsonKey(name: "children")
          final List<ItemDetail>? children,
      @JsonKey(name: "parent_id")
          final int? parentId,
      @JsonKey(name: "story_id")
          final int? storyId,
      final String? url,
      @JsonKey(name: "points")
          final int? score,
      final bool collapsed}) = _$_ItemDetail;
  const _ItemDetail._() : super._();

  factory _ItemDetail.fromJson(Map<String, dynamic> json) =
      _$_ItemDetail.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "author", defaultValue: "")
  String get author => throw _privateConstructorUsedError;
  @override // -----
  @JsonKey(name: "created_at", fromJson: DateTime.parse)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override // -----
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "text")
  String? get body => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "children")
  List<ItemDetail>? get children => throw _privateConstructorUsedError;
  @override // @JsonKey(name: "parts") List<int>? pollOptIds,
  @JsonKey(name: "parent_id")
  int? get parentId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "story_id")
  int? get storyId => throw _privateConstructorUsedError;
  @override
  String? get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "points")
  int? get score => throw _privateConstructorUsedError;
  @override
  bool get collapsed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ItemDetailCopyWith<_$_ItemDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FlatItemDetail {
  int get id => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError; // -----
  DateTime get createdAt => throw _privateConstructorUsedError; // -----
  String? get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;
  int? get storyId => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  bool get collapsed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlatItemDetailCopyWith<FlatItemDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlatItemDetailCopyWith<$Res> {
  factory $FlatItemDetailCopyWith(
          FlatItemDetail value, $Res Function(FlatItemDetail) then) =
      _$FlatItemDetailCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String author,
      DateTime createdAt,
      String? title,
      String? body,
      int? parentId,
      int? storyId,
      String? url,
      int? score,
      int level,
      bool collapsed});
}

/// @nodoc
class _$FlatItemDetailCopyWithImpl<$Res>
    implements $FlatItemDetailCopyWith<$Res> {
  _$FlatItemDetailCopyWithImpl(this._value, this._then);

  final FlatItemDetail _value;
  // ignore: unused_field
  final $Res Function(FlatItemDetail) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? createdAt = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? parentId = freezed,
    Object? storyId = freezed,
    Object? url = freezed,
    Object? score = freezed,
    Object? level = freezed,
    Object? collapsed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      storyId: storyId == freezed
          ? _value.storyId
          : storyId // ignore: cast_nullable_to_non_nullable
              as int?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      collapsed: collapsed == freezed
          ? _value.collapsed
          : collapsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_FlatItemDetailCopyWith<$Res>
    implements $FlatItemDetailCopyWith<$Res> {
  factory _$$_FlatItemDetailCopyWith(
          _$_FlatItemDetail value, $Res Function(_$_FlatItemDetail) then) =
      __$$_FlatItemDetailCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String author,
      DateTime createdAt,
      String? title,
      String? body,
      int? parentId,
      int? storyId,
      String? url,
      int? score,
      int level,
      bool collapsed});
}

/// @nodoc
class __$$_FlatItemDetailCopyWithImpl<$Res>
    extends _$FlatItemDetailCopyWithImpl<$Res>
    implements _$$_FlatItemDetailCopyWith<$Res> {
  __$$_FlatItemDetailCopyWithImpl(
      _$_FlatItemDetail _value, $Res Function(_$_FlatItemDetail) _then)
      : super(_value, (v) => _then(v as _$_FlatItemDetail));

  @override
  _$_FlatItemDetail get _value => super._value as _$_FlatItemDetail;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? createdAt = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? parentId = freezed,
    Object? storyId = freezed,
    Object? url = freezed,
    Object? score = freezed,
    Object? level = freezed,
    Object? collapsed = freezed,
  }) {
    return _then(_$_FlatItemDetail(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      storyId: storyId == freezed
          ? _value.storyId
          : storyId // ignore: cast_nullable_to_non_nullable
              as int?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      collapsed: collapsed == freezed
          ? _value.collapsed
          : collapsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FlatItemDetail extends _FlatItemDetail {
  const _$_FlatItemDetail(
      {required this.id,
      required this.author,
      required this.createdAt,
      this.title,
      this.body,
      this.parentId,
      this.storyId,
      this.url,
      this.score,
      this.level = 0,
      this.collapsed = false})
      : super._();

  @override
  final int id;
  @override
  final String author;
// -----
  @override
  final DateTime createdAt;
// -----
  @override
  final String? title;
  @override
  final String? body;
  @override
  final int? parentId;
  @override
  final int? storyId;
  @override
  final String? url;
  @override
  final int? score;
  @override
  @JsonKey()
  final int level;
  @override
  @JsonKey()
  final bool collapsed;

  @override
  String toString() {
    return 'FlatItemDetail(id: $id, author: $author, createdAt: $createdAt, title: $title, body: $body, parentId: $parentId, storyId: $storyId, url: $url, score: $score, level: $level, collapsed: $collapsed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlatItemDetail &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.parentId, parentId) &&
            const DeepCollectionEquality().equals(other.storyId, storyId) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality().equals(other.level, level) &&
            const DeepCollectionEquality().equals(other.collapsed, collapsed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(parentId),
      const DeepCollectionEquality().hash(storyId),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(score),
      const DeepCollectionEquality().hash(level),
      const DeepCollectionEquality().hash(collapsed));

  @JsonKey(ignore: true)
  @override
  _$$_FlatItemDetailCopyWith<_$_FlatItemDetail> get copyWith =>
      __$$_FlatItemDetailCopyWithImpl<_$_FlatItemDetail>(this, _$identity);
}

abstract class _FlatItemDetail extends FlatItemDetail {
  const factory _FlatItemDetail(
      {required final int id,
      required final String author,
      required final DateTime createdAt,
      final String? title,
      final String? body,
      final int? parentId,
      final int? storyId,
      final String? url,
      final int? score,
      final int level,
      final bool collapsed}) = _$_FlatItemDetail;
  const _FlatItemDetail._() : super._();

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get author => throw _privateConstructorUsedError;
  @override // -----
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override // -----
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get body => throw _privateConstructorUsedError;
  @override
  int? get parentId => throw _privateConstructorUsedError;
  @override
  int? get storyId => throw _privateConstructorUsedError;
  @override
  String? get url => throw _privateConstructorUsedError;
  @override
  int? get score => throw _privateConstructorUsedError;
  @override
  int get level => throw _privateConstructorUsedError;
  @override
  bool get collapsed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FlatItemDetailCopyWith<_$_FlatItemDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
