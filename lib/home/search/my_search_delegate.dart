import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/home/story_card.dart';
import '../../common/asyncstate.dart';
import '../../models/item.dart';
import '../../repository/repository.dart';
import './search_item.dart';

class MySearchDelegate extends SearchDelegate {
  MySearchDelegate();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      ref.read(searchProvider.notifier).search(query);
      final state = ref.watch(searchProvider);

      return state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (msg) => Center(child: Text(msg)),
        data: (data) => ListView.builder(
          itemBuilder: (context, index) {
            final ItemEntity item = data[index];
            return StoryCardContent(item, visited: false);
          },
          itemCount: data.length,
        ),
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}

typedef SearchState = AsyncState<IList<SearchItem>>;

final searchProvider =
    StateNotifierProvider<SearchNotifierProvider, SearchState>((ref) {
  final repo = ref.read(repositoryProvider);
  return SearchNotifierProvider(repo);
});

class SearchNotifierProvider extends StateNotifier<SearchState> {
  SearchNotifierProvider(this.repo) : super(const AsyncState.loading());
  final Repository repo;

  Future<void> search(String query) async {
    final results = await repo.search(query);

    state = results.fold(
      (l) => AsyncState.error(l.message),
      (r) => AsyncState.data(r.toIList()),
    );
  }
}
