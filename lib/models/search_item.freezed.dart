// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchItem _$SearchItemFromJson(Map<String, dynamic> json) {
  return _SearchItem.fromJson(json);
}

/// @nodoc
mixin _$SearchItem {
  @JsonKey(name: "objectID", fromJson: int.tryParse)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "author", defaultValue: "")
  String get author => throw _privateConstructorUsedError; // -----
  @JsonKey(name: "created_at", fromJson: DateTime.parse)
  DateTime get createdAt => throw _privateConstructorUsedError; // -----
  String? get title => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: "points")
  int? get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchItemCopyWith<SearchItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchItemCopyWith<$Res> {
  factory $SearchItemCopyWith(
          SearchItem value, $Res Function(SearchItem) then) =
      _$SearchItemCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "objectID", fromJson: int.tryParse) int? id,
      @JsonKey(name: "author", defaultValue: "") String author,
      @JsonKey(name: "created_at", fromJson: DateTime.parse) DateTime createdAt,
      String? title,
      String? url,
      @JsonKey(name: "points") int? score});
}

/// @nodoc
class _$SearchItemCopyWithImpl<$Res> implements $SearchItemCopyWith<$Res> {
  _$SearchItemCopyWithImpl(this._value, this._then);

  final SearchItem _value;
  // ignore: unused_field
  final $Res Function(SearchItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? createdAt = freezed,
    Object? title = freezed,
    Object? url = freezed,
    Object? score = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_SearchItemCopyWith<$Res>
    implements $SearchItemCopyWith<$Res> {
  factory _$$_SearchItemCopyWith(
          _$_SearchItem value, $Res Function(_$_SearchItem) then) =
      __$$_SearchItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "objectID", fromJson: int.tryParse) int? id,
      @JsonKey(name: "author", defaultValue: "") String author,
      @JsonKey(name: "created_at", fromJson: DateTime.parse) DateTime createdAt,
      String? title,
      String? url,
      @JsonKey(name: "points") int? score});
}

/// @nodoc
class __$$_SearchItemCopyWithImpl<$Res> extends _$SearchItemCopyWithImpl<$Res>
    implements _$$_SearchItemCopyWith<$Res> {
  __$$_SearchItemCopyWithImpl(
      _$_SearchItem _value, $Res Function(_$_SearchItem) _then)
      : super(_value, (v) => _then(v as _$_SearchItem));

  @override
  _$_SearchItem get _value => super._value as _$_SearchItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? createdAt = freezed,
    Object? title = freezed,
    Object? url = freezed,
    Object? score = freezed,
  }) {
    return _then(_$_SearchItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchItem implements _SearchItem {
  _$_SearchItem(
      {@JsonKey(name: "objectID", fromJson: int.tryParse)
          this.id,
      @JsonKey(name: "author", defaultValue: "")
          required this.author,
      @JsonKey(name: "created_at", fromJson: DateTime.parse)
          required this.createdAt,
      this.title,
      this.url,
      @JsonKey(name: "points")
          this.score});

  factory _$_SearchItem.fromJson(Map<String, dynamic> json) =>
      _$$_SearchItemFromJson(json);

  @override
  @JsonKey(name: "objectID", fromJson: int.tryParse)
  final int? id;
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
  final String? url;
  @override
  @JsonKey(name: "points")
  final int? score;

  @override
  String toString() {
    return 'SearchItem(id: $id, author: $author, createdAt: $createdAt, title: $title, url: $url, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchItem &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.score, score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(score));

  @JsonKey(ignore: true)
  @override
  _$$_SearchItemCopyWith<_$_SearchItem> get copyWith =>
      __$$_SearchItemCopyWithImpl<_$_SearchItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchItemToJson(this);
  }
}

abstract class _SearchItem implements SearchItem {
  factory _SearchItem(
      {@JsonKey(name: "objectID", fromJson: int.tryParse)
          final int? id,
      @JsonKey(name: "author", defaultValue: "")
          required final String author,
      @JsonKey(name: "created_at", fromJson: DateTime.parse)
          required final DateTime createdAt,
      final String? title,
      final String? url,
      @JsonKey(name: "points")
          final int? score}) = _$_SearchItem;

  factory _SearchItem.fromJson(Map<String, dynamic> json) =
      _$_SearchItem.fromJson;

  @override
  @JsonKey(name: "objectID", fromJson: int.tryParse)
  int? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "author", defaultValue: "")
  String get author => throw _privateConstructorUsedError;
  @override // -----
  @JsonKey(name: "created_at", fromJson: DateTime.parse)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override // -----
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "points")
  int? get score => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SearchItemCopyWith<_$_SearchItem> get copyWith =>
      throw _privateConstructorUsedError;
}
