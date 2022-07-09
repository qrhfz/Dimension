import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/repository/repository.dart';
import 'package:hn_client/view/providers/home_state.dart';

import '../../models/failure.dart';

final homeNotifierProvider =
    StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final repository = ref.read(repositoryProvider);
  return HomeNotifier(repository);
});

class HomeNotifier extends StateNotifier<HomeState> {
  final Repository repository;

  HomeNotifier(this.repository)
      : super(const HomeState.loading(HomeContentType.top));

  Future<void> load(HomeContentType type) async {
    state = HomeState.loading(type);
    late final Either<Failure, List<int>> failureOrIDs;

    switch (type) {
      case HomeContentType.best:
        failureOrIDs = await repository.getBestStoryIds();
        break;
      case HomeContentType.top:
        failureOrIDs = await repository.getTopStoryIds();
        break;
      case HomeContentType.new_:
        failureOrIDs = await repository.getNewStoryIds();
        break;
      case HomeContentType.ask:
        failureOrIDs = await repository.getAskStoryIds();
        break;
      case HomeContentType.job:
        failureOrIDs = await repository.getJobStoryIds();
        break;
      case HomeContentType.show:
        failureOrIDs = await repository.getShowStoryIds();
        break;
    }

    state = failureOrIDs.fold(
      (failure) => HomeState.error(type, failure),
      (ids) => HomeState.data(type, ids),
    );
  }

  Future<void> setType(HomeContentType type) async {
    load(type);
  }
}
