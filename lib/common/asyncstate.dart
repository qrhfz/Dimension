import 'package:freezed_annotation/freezed_annotation.dart';

part 'asyncstate.freezed.dart';

@freezed
class AsyncState<T> with _$AsyncState<T> {
  const factory AsyncState.loading() = Loading<T>;
  const factory AsyncState.data(T data) = Data<T>;
  const factory AsyncState.error(String message) = Fail<T>;
}
