import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/failure.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  const factory HomeState.data(List<int> ids) = _Data;
  const factory HomeState.error(Failure failure) = _Error;
}
