import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/home/search/search_result_item_tile.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../common/asyncstate.dart';
import '../../item/visit_notifier.dart';
import '../../repository/repository.dart';
import './search_item.dart';
import 'search.dart' as cs;

class MySearchDelegate extends cs.SearchDelegate {
  MySearchDelegate();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Consumer(builder: (context, ref, child) {
        final sortMode = ref.watch(searchModeProvider);
        final sortModeNotifier = ref.watch(searchModeProvider.notifier);
        return PopupMenuButton<bool>(
          icon: const Icon(Icons.sort),
          initialValue: sortMode,
          itemBuilder: (context) {
            return const [
              PopupMenuItem(child: Text('Popular'), value: false),
              PopupMenuItem(child: Text('Newest'), value: true),
            ];
          },
          onSelected: (value) {
            sortModeNotifier.state = value;
          },
        );
      })
    ];
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

final searchModeProvider = StateProvider<bool>((ref) => false);
final searchProvider =
    StateNotifierProvider<SearchNotifierProvider, SearchState>((ref) {
  final repo = ref.watch(repositoryProvider);
  return SearchNotifierProvider(repo, ref);
});

class SearchNotifierProvider extends StateNotifier<SearchState> {
  SearchNotifierProvider(this.repo, this.ref)
      : super(const SearchState.loading());

  final StateNotifierProviderRef<SearchNotifierProvider, SearchState> ref;
  final Repository repo;

  Future<void> search(String query, int page) async {
    final searchMode = ref.watch(searchModeProvider);
    if (state != const SearchState.loading()) {
      state = const SearchState.loading();
    }
    final results = await repo.search(
      query,
      searchMode,
      page,
    );

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
    await ref.watch(searchProvider.notifier).search(widget.query, pageKey);
    final state = ref.watch(searchProvider);

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
    ref.listen<bool>(searchModeProvider, (previous, next) async {
      if (previous != next) {
        _pagingController.refresh();
        await _fetchResults(0);
      }
    });
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
