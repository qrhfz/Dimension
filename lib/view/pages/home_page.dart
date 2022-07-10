import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hn_client/models/failure.dart';
import 'package:hn_client/models/search_item.dart';
import 'package:hn_client/repository/repository.dart';
import 'package:hn_client/view/widgets/story_card.dart';

import '../providers/home/home_notifier.dart';
import '../providers/home/home_state.dart';
import 'thread_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({this.initialType = HomeContentType.top, Key? key})
      : super(key: key);
  final HomeContentType initialType;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final types = [
    HomeContentType.top,
    HomeContentType.best,
    HomeContentType.new_,
    HomeContentType.ask,
    HomeContentType.show,
    HomeContentType.job
  ];
  @override
  void initState() {
    super.initState();
    ref.read(homeNotifierProvider.notifier).setType(widget.initialType);
  }

  void onIndexChange(int index, HomeNotifier notifier) {
    notifier.load(types[index]);
  }

  @override
  Widget build(context) {
    final state = ref.watch(homeNotifierProvider);
    final notifier = ref.read(homeNotifierProvider.notifier);
    final currentIndex = types.indexOf(state.contentType);

    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth >= 800) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.contentType.name),
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(
                        context: context, delegate: MySearchDelegate(ref));
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
          body: Row(
            children: [
              MyNavRail(
                types: types,
                onTap: (index) => onIndexChange(index, notifier),
                currentIndex: currentIndex,
              ),
              Flexible(
                child: state.when(
                  loading: loading,
                  data: data,
                  error: error,
                ),
              ),
            ],
          ),
        );
      }

      return Scaffold(
        appBar: AppBar(
          title: Text(state.contentType.name),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: state.when(
          loading: loading,
          data: data,
          error: error,
        ),
        bottomNavigationBar: MyNavBar(
          types: types,
          currentIndex: currentIndex,
          onTap: (index) => onIndexChange(index, notifier),
        ),
      );
    });
  }

  Widget loading(_) => const Center(child: CircularProgressIndicator());

  Widget data(HomeContentType type, List<int> ids) {
    return ListView.builder(
      itemCount: ids.length,
      itemBuilder: (ctx, index) {
        final id = ids[index];
        return StoryCard(id);
      },
    );
  }

  Widget error(_, Failure failure) {
    return Center(child: Text(failure.message));
  }
}

class MyNavBar extends StatelessWidget {
  const MyNavBar({
    Key? key,
    required this.types,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  final List<HomeContentType> types;
  final int currentIndex;

  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.white,
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Top"),
        BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: "Best"),
        BottomNavigationBarItem(icon: Icon(Icons.update), label: "New"),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_answer),
          label: "Ask HN",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.tips_and_updates_sharp), label: "Show HN"),
        BottomNavigationBarItem(
            icon: Icon(Icons.cases_outlined), label: "Jobs"),
      ],
      onTap: onTap,
    );
  }
}

class MyNavRail extends StatelessWidget {
  const MyNavRail({
    Key? key,
    required this.currentIndex,
    required this.types,
    required this.onTap,
  }) : super(key: key);

  final List<HomeContentType> types;
  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
        onDestinationSelected: onTap,
        destinations: const [
          NavigationRailDestination(icon: Icon(Icons.home), label: Text("Top")),
          NavigationRailDestination(
              icon: Icon(Icons.trending_up), label: Text("Best")),
          NavigationRailDestination(
              icon: Icon(Icons.update), label: Text("New")),
          NavigationRailDestination(
            icon: Icon(Icons.question_answer),
            label: Text("Ask HN"),
          ),
          NavigationRailDestination(
              icon: Icon(Icons.tips_and_updates_sharp), label: Text("Show HN")),
          NavigationRailDestination(
              icon: Icon(Icons.cases_outlined), label: Text("Jobs")),
        ],
        selectedIndex: currentIndex);
  }
}

class MySearchDelegate extends SearchDelegate {
  MySearchDelegate(this.ref);

  final WidgetRef ref;

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
    final repo = ref.read(repositoryProvider);
    final searchResults = repo.search(query);

    return FutureBuilder<Either<Failure, List<SearchItem>>>(
      future: searchResults,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('App Error'));
        } else if (snapshot.hasData) {
          return snapshot.data!.fold(
            (l) => Center(child: Text(l.message)),
            (r) => ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(r[index].title ?? ""),
                  subtitle: Text("${r[index].author} ${r[index].createdAt}"),
                  onTap: () {
                    if (r[index].id == null) return;
                    GoRouter.of(context)
                        .go(ThreadPage.routeBuilder(r[index].id!));
                  },
                );
              },
              itemCount: r.length,
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}
