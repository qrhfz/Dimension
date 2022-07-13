// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'asyncstate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AsyncState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Data<T> value) data,
    required TResult Function(Fail<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Data<T> value)? data,
    TResult Function(Fail<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Data<T> value)? data,
    TResult Function(Fail<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsyncStateCopyWith<T, $Res> {
  factory $AsyncStateCopyWith(
          AsyncState<T> value, $Res Function(AsyncState<T>) then) =
      _$AsyncStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$AsyncStateCopyWithImpl<T, $Res>
    implements $AsyncStateCopyWith<T, $Res> {
  _$AsyncStateCopyWithImpl(this._value, this._then);

  final AsyncState<T> _value;
  // ignore: unused_field
  final $Res Function(AsyncState<T>) _then;
}

/// @nodoc
abstract class _$$LoadingCopyWith<T, $Res> {
  factory _$$LoadingCopyWith(
          _$Loading<T> value, $Res Function(_$Loading<T>) then) =
      __$$LoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<T, $Res> extends _$AsyncStateCopyWithImpl<T, $Res>
    implements _$$LoadingCopyWith<T, $Res> {
  __$$LoadingCopyWithImpl(
      _$Loading<T> _value, $Res Function(_$Loading<T>) _then)
      : super(_value, (v) => _then(v as _$Loading<T>));

  @override
  _$Loading<T> get _value => super._value as _$Loading<T>;
}

/// @nodoc

class _$Loading<T> implements Loading<T> {
  const _$Loading();

  @override
  String toString() {
    return 'AsyncState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Data<T> value) data,
    required TResult Function(Fail<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Data<T> value)? data,
    TResult Function(Fail<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Data<T> value)? data,
    TResult Function(Fail<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements AsyncState<T> {
  const factory Loading() = _$Loading<T>;
}

/// @nodoc
abstract class _$$DataCopyWith<T, $Res> {
  factory _$$DataCopyWith(_$Data<T> value, $Res Function(_$Data<T>) then) =
      __$$DataCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$$DataCopyWithImpl<T, $Res> extends _$AsyncStateCopyWithImpl<T, $Res>
    implements _$$DataCopyWith<T, $Res> {
  __$$DataCopyWithImpl(_$Data<T> _value, $Res Function(_$Data<T>) _then)
      : super(_value, (v) => _then(v as _$Data<T>));

  @override
  _$Data<T> get _value => super._value as _$Data<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Data<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Data<T> implements Data<T> {
  const _$Data(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'AsyncState<$T>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Data<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$DataCopyWith<T, _$Data<T>> get copyWith =>
      __$$DataCopyWithImpl<T, _$Data<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(String message) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String message)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Data<T> value) data,
    required TResult Function(Fail<T> value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Data<T> value)? data,
    TResult Function(Fail<T> value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Data<T> value)? data,
    TResult Function(Fail<T> value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class Data<T> implements AsyncState<T> {
  const factory Data(final T data) = _$Data<T>;

  T get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$DataCopyWith<T, _$Data<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailCopyWith<T, $Res> {
  factory _$$FailCopyWith(_$Fail<T> value, $Res Function(_$Fail<T>) then) =
      __$$FailCopyWithImpl<T, $Res>;
  $Res call({String message});
}

/// @nodoc
class __$$FailCopyWithImpl<T, $Res> extends _$AsyncStateCopyWithImpl<T, $Res>
    implements _$$FailCopyWith<T, $Res> {
  __$$FailCopyWithImpl(_$Fail<T> _value, $Res Function(_$Fail<T>) _then)
      : super(_value, (v) => _then(v as _$Fail<T>));

  @override
  _$Fail<T> get _value => super._value as _$Fail<T>;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$Fail<T>(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Fail<T> implements Fail<T> {
  const _$Fail(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AsyncState<$T>.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Fail<T> &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$FailCopyWith<T, _$Fail<T>> get copyWith =>
      __$$FailCopyWithImpl<T, _$Fail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Data<T> value) data,
    required TResult Function(Fail<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Data<T> value)? data,
    TResult Function(Fail<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Data<T> value)? data,
    TResult Function(Fail<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Fail<T> implements AsyncState<T> {
  const factory Fail(final String message) = _$Fail<T>;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$FailCopyWith<T, _$Fail<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
