import 'package:freezed_annotation/freezed_annotation.dart';

part 'asyncstate.freezed.dart';

@freezed
class AsyncState<T> with _$AsyncState {
  const factory AsyncState.loading() = _Loading;
  const factory AsyncState.data(T data) = _Data;
  const factory AsyncState.error(String message) = _Error;
}
