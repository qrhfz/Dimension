import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/home/search/search_result_item_tile.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../common/asyncstate.dart';
import '../../item/visit_notifier.dart';
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

  Future<void> search(String query, int page) async {
    if (state != const SearchState.loading()) {
      state = const SearchState.loading();
    }
    final results = await repo.search(query, page);

    state = results.fold(
      (l) {
        return SearchState.error(l.message);
      },
      (r) => SearchState.data(r.toIList()),
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
  final PagingController<int, SearchItem> _pagingController =
      PagingController(firstPageKey: 0);
  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      Future.delayed(Duration.zero, () {
        _fetchResults(pageKey);
      });
    });

    super.initState();
  }

  Future<void> _fetchResults(int pageKey) async {
    await ref.read(searchProvider.notifier).search(widget.query, pageKey);
    final state = ref.read(searchProvider);

    state.when(
      loading: () {},
      data: (d) {
        _pagingController.appendPage(d.toList(), pageKey + 1);
      },
      error: (err) {
        _pagingController.appendPage([], null);
        _pagingController.error = err;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, SearchItem>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) {
          final visitState = ref.watch(visitationFamily(item.id));
          return SearchResultItemTile(item, visited: visitState);
        },
      ),
    );
  }
}
