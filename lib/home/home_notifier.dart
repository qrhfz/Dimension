import 'package:dartz/dartz.dart';
import 'package:dimension/item/item_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/repository/repository.dart';

import '../models/failure.dart';
import 'home_state.dart';

final homeContentTypeProvider = StateProvider((ref) => HomeContentType.top);

final homeNotifierProvider = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) {
    final repository = ref.watch(repositoryProvider);
    final type = ref.watch(homeContentTypeProvider);
    return HomeNotifier(repository, ref, type);
  },
);

class HomeNotifier extends StateNotifier<HomeState> {
  final Repository repository;
  final Ref ref;
  final HomeContentType type;

  HomeNotifier(this.repository, this.ref, this.type)
      : super(HomeState.loading(type)) {
    load();
  }

  Future<void> load() async {
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
    if (!mounted) return;
    state = failureOrIDs.fold(
      (failure) => HomeState.error(type, failure),
      (ids) => HomeState.data(type, ids),
    );
  }

  void refresh() {
    state.maybeWhen(
      data: (type, ids) {
        for (var id in ids) {
          ref.refresh(itemFamily(id));
        }
      },
      orElse: () {},
    );

    load();
  }
}
