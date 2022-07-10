import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/models/failure.dart';
import 'package:hn_client/view/widgets/story_card.dart';

import '../providers/home/home_notifier.dart';
import '../providers/home/home_state.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({this.initialType = HomeContentType.top, Key? key})
      : super(key: key);
  final HomeContentType initialType;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(homeNotifierProvider.notifier).setType(widget.initialType);
  }

  @override
  Widget build(context) {
    final state = ref.watch(homeNotifierProvider);
    final notifier = ref.read(homeNotifierProvider.notifier);

    final types = [
      HomeContentType.top,
      HomeContentType.best,
      HomeContentType.new_,
      HomeContentType.ask,
      HomeContentType.show,
      HomeContentType.job
    ];
    final currentIndex = types.indexOf(state.contentType);

    void onIndexChange(index) {
      notifier.load(types[index]);
    }

    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth <= 800) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.contentType.name),
          ),
          body: Row(
            children: [
              MyNavRail(
                types: types,
                onTap: onIndexChange,
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
          bottomNavigationBar: MyNavBar(
            types: types,
            currentIndex: currentIndex,
            onTap: onIndexChange,
          ),
        );
      }

      return Scaffold(
        appBar: AppBar(
          title: Text(state.contentType.name),
        ),
        body: Row(
          children: [
            MyNavRail(
              types: types,
              onTap: onIndexChange,
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
        bottomNavigationBar: MyNavBar(
          types: types,
          currentIndex: currentIndex,
          onTap: onIndexChange,
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
        BottomNavigationBarItem(icon: Icon(Icons.new_releases), label: "New"),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_answer),
          label: "Ask HN",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.stars), label: "Show HN"),
        BottomNavigationBarItem(icon: Icon(Icons.cases), label: "Jobs"),
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
              icon: Icon(Icons.new_releases), label: Text("New")),
          NavigationRailDestination(
            icon: Icon(Icons.question_answer),
            label: Text("Ask HN"),
          ),
          NavigationRailDestination(
              icon: Icon(Icons.stars), label: Text("Show HN")),
          NavigationRailDestination(
              icon: Icon(Icons.cases), label: Text("Jobs")),
        ],
        selectedIndex: currentIndex);
  }
}
