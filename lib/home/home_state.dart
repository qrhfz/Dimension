import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/failure.dart';
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

extension HomeContentText on HomeContentType {
  String get name {
    switch (this) {
      case HomeContentType.best:
        return "Best";
      case HomeContentType.top:
        return "Top";
      case HomeContentType.new_:
        return "New";
      case HomeContentType.ask:
        return "AskHN";
      case HomeContentType.job:
        return "Job";
      case HomeContentType.show:
        return "ShowHN";
      default:
        return "unknown";
    }
  }
}
