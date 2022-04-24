// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "by", defaultValue: "")
  String get author => throw _privateConstructorUsedError; // -----
  @JsonKey(name: "time", fromJson: secondsFromEpochToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError; // -----
  ItemType get type => throw _privateConstructorUsedError;
  @JsonKey(name: "deleted")
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: "dead")
  bool? get isDead => throw _privateConstructorUsedError;
  @JsonKey(name: "poll")
  int? get pollId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "text")
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: "kids")
  List<int>? get childrenIds => throw _privateConstructorUsedError;
  @JsonKey(name: "parts")
  List<int>? get pollOptIds => throw _privateConstructorUsedError;
  @JsonKey(name: "parent")
  int? get parentId => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;
  @JsonKey(name: "descendants")
  int? get descendantCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: "by", defaultValue: "")
          String author,
      @JsonKey(name: "time", fromJson: secondsFromEpochToDateTime)
          DateTime createdAt,
      ItemType type,
      @JsonKey(name: "deleted")
          bool? isDeleted,
      @JsonKey(name: "dead")
          bool? isDead,
      @JsonKey(name: "poll")
          int? pollId,
      String? title,
      @JsonKey(name: "text")
          String? body,
      @JsonKey(name: "kids")
          List<int>? childrenIds,
      @JsonKey(name: "parts")
          List<int>? pollOptIds,
      @JsonKey(name: "parent")
          int? parentId,
      String? url,
      int? score,
      @JsonKey(name: "descendants")
          int? descendantCount});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? createdAt = freezed,
    Object? type = freezed,
    Object? isDeleted = freezed,
    Object? isDead = freezed,
    Object? pollId = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? childrenIds = freezed,
    Object? pollOptIds = freezed,
    Object? parentId = freezed,
    Object? url = freezed,
    Object? score = freezed,
    Object? descendantCount = freezed,
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
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ItemType,
      isDeleted: isDeleted == freezed
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDead: isDead == freezed
          ? _value.isDead
          : isDead // ignore: cast_nullable_to_non_nullable
              as bool?,
      pollId: pollId == freezed
          ? _value.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      childrenIds: childrenIds == freezed
          ? _value.childrenIds
          : childrenIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      pollOptIds: pollOptIds == freezed
          ? _value.pollOptIds
          : pollOptIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      descendantCount: descendantCount == freezed
          ? _value.descendantCount
          : descendantCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) then) =
      __$ItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: "by", defaultValue: "")
          String author,
      @JsonKey(name: "time", fromJson: secondsFromEpochToDateTime)
          DateTime createdAt,
      ItemType type,
      @JsonKey(name: "deleted")
          bool? isDeleted,
      @JsonKey(name: "dead")
          bool? isDead,
      @JsonKey(name: "poll")
          int? pollId,
      String? title,
      @JsonKey(name: "text")
          String? body,
      @JsonKey(name: "kids")
          List<int>? childrenIds,
      @JsonKey(name: "parts")
          List<int>? pollOptIds,
      @JsonKey(name: "parent")
          int? parentId,
      String? url,
      int? score,
      @JsonKey(name: "descendants")
          int? descendantCount});
}

/// @nodoc
class __$ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(_Item _value, $Res Function(_Item) _then)
      : super(_value, (v) => _then(v as _Item));

  @override
  _Item get _value => super._value as _Item;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? createdAt = freezed,
    Object? type = freezed,
    Object? isDeleted = freezed,
    Object? isDead = freezed,
    Object? pollId = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? childrenIds = freezed,
    Object? pollOptIds = freezed,
    Object? parentId = freezed,
    Object? url = freezed,
    Object? score = freezed,
    Object? descendantCount = freezed,
  }) {
    return _then(_Item(
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
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ItemType,
      isDeleted: isDeleted == freezed
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDead: isDead == freezed
          ? _value.isDead
          : isDead // ignore: cast_nullable_to_non_nullable
              as bool?,
      pollId: pollId == freezed
          ? _value.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      childrenIds: childrenIds == freezed
          ? _value.childrenIds
          : childrenIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      pollOptIds: pollOptIds == freezed
          ? _value.pollOptIds
          : pollOptIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      descendantCount: descendantCount == freezed
          ? _value.descendantCount
          : descendantCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item extends _Item {
  const _$_Item(
      {required this.id,
      @JsonKey(name: "by", defaultValue: "")
          required this.author,
      @JsonKey(name: "time", fromJson: secondsFromEpochToDateTime)
          required this.createdAt,
      required this.type,
      @JsonKey(name: "deleted")
          this.isDeleted,
      @JsonKey(name: "dead")
          this.isDead,
      @JsonKey(name: "poll")
          this.pollId,
      this.title,
      @JsonKey(name: "text")
          this.body,
      @JsonKey(name: "kids")
          final List<int>? childrenIds,
      @JsonKey(name: "parts")
          final List<int>? pollOptIds,
      @JsonKey(name: "parent")
          this.parentId,
      this.url,
      this.score,
      @JsonKey(name: "descendants")
          this.descendantCount})
      : _childrenIds = childrenIds,
        _pollOptIds = pollOptIds,
        super._();

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "by", defaultValue: "")
  final String author;
// -----
  @override
  @JsonKey(name: "time", fromJson: secondsFromEpochToDateTime)
  final DateTime createdAt;
// -----
  @override
  final ItemType type;
  @override
  @JsonKey(name: "deleted")
  final bool? isDeleted;
  @override
  @JsonKey(name: "dead")
  final bool? isDead;
  @override
  @JsonKey(name: "poll")
  final int? pollId;
  @override
  final String? title;
  @override
  @JsonKey(name: "text")
  final String? body;
  @JsonKey(name: "kids")
  final List<int>? _childrenIds;
  @override
  @JsonKey(name: "kids")
  List<int>? get childrenIds {
    final value = _childrenIds;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @JsonKey(name: "parts")
  final List<int>? _pollOptIds;
  @override
  @JsonKey(name: "parts")
  List<int>? get pollOptIds {
    final value = _pollOptIds;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "parent")
  final int? parentId;
  @override
  final String? url;
  @override
  final int? score;
  @override
  @JsonKey(name: "descendants")
  final int? descendantCount;

  @override
  String toString() {
    return 'Item(id: $id, author: $author, createdAt: $createdAt, type: $type, isDeleted: $isDeleted, isDead: $isDead, pollId: $pollId, title: $title, body: $body, childrenIds: $childrenIds, pollOptIds: $pollOptIds, parentId: $parentId, url: $url, score: $score, descendantCount: $descendantCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Item &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.isDeleted, isDeleted) &&
            const DeepCollectionEquality().equals(other.isDead, isDead) &&
            const DeepCollectionEquality().equals(other.pollId, pollId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality()
                .equals(other.childrenIds, childrenIds) &&
            const DeepCollectionEquality()
                .equals(other.pollOptIds, pollOptIds) &&
            const DeepCollectionEquality().equals(other.parentId, parentId) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality()
                .equals(other.descendantCount, descendantCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(isDeleted),
      const DeepCollectionEquality().hash(isDead),
      const DeepCollectionEquality().hash(pollId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(childrenIds),
      const DeepCollectionEquality().hash(pollOptIds),
      const DeepCollectionEquality().hash(parentId),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(score),
      const DeepCollectionEquality().hash(descendantCount));

  @JsonKey(ignore: true)
  @override
  _$ItemCopyWith<_Item> get copyWith =>
      __$ItemCopyWithImpl<_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(this);
  }
}

abstract class _Item extends Item {
  const factory _Item(
      {required final int id,
      @JsonKey(name: "by", defaultValue: "")
          required final String author,
      @JsonKey(name: "time", fromJson: secondsFromEpochToDateTime)
          required final DateTime createdAt,
      required final ItemType type,
      @JsonKey(name: "deleted")
          final bool? isDeleted,
      @JsonKey(name: "dead")
          final bool? isDead,
      @JsonKey(name: "poll")
          final int? pollId,
      final String? title,
      @JsonKey(name: "text")
          final String? body,
      @JsonKey(name: "kids")
          final List<int>? childrenIds,
      @JsonKey(name: "parts")
          final List<int>? pollOptIds,
      @JsonKey(name: "parent")
          final int? parentId,
      final String? url,
      final int? score,
      @JsonKey(name: "descendants")
          final int? descendantCount}) = _$_Item;
  const _Item._() : super._();

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "by", defaultValue: "")
  String get author => throw _privateConstructorUsedError;
  @override // -----
  @JsonKey(name: "time", fromJson: secondsFromEpochToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override // -----
  ItemType get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "deleted")
  bool? get isDeleted => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "dead")
  bool? get isDead => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "poll")
  int? get pollId => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "text")
  String? get body => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "kids")
  List<int>? get childrenIds => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "parts")
  List<int>? get pollOptIds => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "parent")
  int? get parentId => throw _privateConstructorUsedError;
  @override
  String? get url => throw _privateConstructorUsedError;
  @override
  int? get score => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "descendants")
  int? get descendantCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ItemCopyWith<_Item> get copyWith => throw _privateConstructorUsedError;
}
