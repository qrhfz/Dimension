import 'dart:developer';

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
    return SearchResult(query);
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
  SearchNotifierProvider(this.repo) : super(const SearchState.loading());
  final Repository repo;

  Future<void> search(String query) async {
    if (state != const SearchState.loading()) {
      state = const SearchState.loading();
    }
    log("SEARCH");
    final results = await repo.search(query);

    state = results.fold(
      (l) => AsyncState.error(l.message),
      (r) => AsyncState.data(r.toIList()),
    );
  }
}

class SearchResult extends ConsumerStatefulWidget {
  const SearchResult(this.query, {Key? key}) : super(key: key);

  final String query;

  @override
  ConsumerState<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends ConsumerState<SearchResult> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(searchProvider.notifier).search(widget.query);
    });
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
