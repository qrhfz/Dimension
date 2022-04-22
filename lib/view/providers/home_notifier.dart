import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/repository/repository.dart';
import 'package:hn_client/view/providers/home_state.dart';

final homeNotifierProvider =
    StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final repository = ref.read(repositoryProvider);
  return HomeNotifier(repository);
});

class HomeNotifier extends StateNotifier<HomeState> {
  final Repository repository;

  HomeNotifier(this.repository) : super(const HomeState.loading());

  void load() async {
    final failureOrIDs = await repository.getNewStoryIds();
    state = failureOrIDs.fold(
      (failure) => HomeState.error(failure),
      (ids) => HomeState.data(ids),
    );
  }
}
