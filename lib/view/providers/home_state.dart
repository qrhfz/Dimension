import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/failure.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading(HomeContentType contentType) = _Loading;
  const factory HomeState.data(HomeContentType contentType, List<int> ids) =
      _Data;
  const factory HomeState.error(HomeContentType contentType, Failure failure) =
      _Error;
}

enum HomeContentType { top, best, new_, ask, job, show }
