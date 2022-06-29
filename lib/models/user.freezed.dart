// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "created", fromJson: secondsFromEpochToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get karma => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  @JsonKey(name: "submitted")
  List<int> get submission => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: "created", fromJson: secondsFromEpochToDateTime)
          DateTime createdAt,
      int karma,
      String? about,
      @JsonKey(name: "submitted")
          List<int> submission});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? karma = freezed,
    Object? about = freezed,
    Object? submission = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      karma: karma == freezed
          ? _value.karma
          : karma // ignore: cast_nullable_to_non_nullable
              as int,
      about: about == freezed
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      submission: submission == freezed
          ? _value.submission
          : submission // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: "created", fromJson: secondsFromEpochToDateTime)
          DateTime createdAt,
      int karma,
      String? about,
      @JsonKey(name: "submitted")
          List<int> submission});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? karma = freezed,
    Object? about = freezed,
    Object? submission = freezed,
  }) {
    return _then(_$_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      karma: karma == freezed
          ? _value.karma
          : karma // ignore: cast_nullable_to_non_nullable
              as int,
      about: about == freezed
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      submission: submission == freezed
          ? _value._submission
          : submission // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {required this.id,
      @JsonKey(name: "created", fromJson: secondsFromEpochToDateTime)
          required this.createdAt,
      required this.karma,
      required this.about,
      @JsonKey(name: "submitted")
          required final List<int> submission})
      : _submission = submission;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "created", fromJson: secondsFromEpochToDateTime)
  final DateTime createdAt;
  @override
  final int karma;
  @override
  final String? about;
  final List<int> _submission;
  @override
  @JsonKey(name: "submitted")
  List<int> get submission {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_submission);
  }

  @override
  String toString() {
    return 'User(id: $id, createdAt: $createdAt, karma: $karma, about: $about, submission: $submission)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.karma, karma) &&
            const DeepCollectionEquality().equals(other.about, about) &&
            const DeepCollectionEquality()
                .equals(other._submission, _submission));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(karma),
      const DeepCollectionEquality().hash(about),
      const DeepCollectionEquality().hash(_submission));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String id,
      @JsonKey(name: "created", fromJson: secondsFromEpochToDateTime)
          required final DateTime createdAt,
      required final int karma,
      required final String? about,
      @JsonKey(name: "submitted")
          required final List<int> submission}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "created", fromJson: secondsFromEpochToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  int get karma => throw _privateConstructorUsedError;
  @override
  String? get about => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "submitted")
  List<int> get submission => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
