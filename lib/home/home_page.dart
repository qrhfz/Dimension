import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './widgets/my_nav_rail.dart';
import 'home_notifier.dart';
import 'home_state.dart';
import 'widgets/my_bottom_nav.dart';
import 'widgets/my_search_button.dart';
import 'widgets/story_tile.dart';

const homeContentTypes = [
  HomeContentType.top,
  HomeContentType.best,
  HomeContentType.new_,
  HomeContentType.ask,
  HomeContentType.show,
  HomeContentType.job
];

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  void onIndexChange(int index, HomeNotifier notifier) {
    notifier.load();
  }

  @override
  Widget build(context) {
    final state = ref.watch(homeNotifierProvider);
    final notifier = ref.watch(homeNotifierProvider.notifier);
    final currentIndex = homeContentTypes.indexOf(state.contentType);

    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth >= 800) {
        return _HomeDesktopContent(
          state: state,
          onNavigate: (index) {
            ref.watch(homeContentTypeProvider.notifier).state =
                homeContentTypes[index];
          },
          currentIndex: currentIndex,
          onRefresh: () {
            notifier.refresh();
          },
        );
      }

      return _HomeMobileContent(
        state: state,
        currentIndex: currentIndex,
        onNavigate: (index) {
          notifier.load();
        },
        onRefresh: () {
          notifier.refresh();
        },
      );
    });
  }
}

class _HomeDesktopContent extends StatelessWidget {
  const _HomeDesktopContent({
    Key? key,
    required this.state,
    required this.onRefresh,
    required this.onNavigate,
    required this.currentIndex,
  }) : super(key: key);

  final HomeState state;
  final void Function() onRefresh;
  final void Function(int) onNavigate;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(state.contentType.name),
        actions: [
          IconButton(
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh),
          ),
          const SearchButton()
        ],
      ),
      body: Row(
        children: [
          MyNavRail(
            onTap: onNavigate,
            currentIndex: currentIndex,
          ),
          Flexible(
            child: state.when(
              loading: (_) => const _Loading(),
              data: (_, ids) => _Data(
                ids,
                onRefresh: () async => onRefresh(),
              ),
              error: (_, f) => _Error(f.message),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeMobileContent extends StatelessWidget {
  const _HomeMobileContent({
    Key? key,
    required this.state,
    required this.onRefresh,
    required this.onNavigate,
    required this.currentIndex,
  }) : super(key: key);

  final HomeState state;
  final Function() onRefresh;
  final void Function(int) onNavigate;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    final currentIndex = homeContentTypes.indexOf(state.contentType);
    return Scaffold(
      appBar: AppBar(
        title: Text(state.contentType.name),
        actions: [
          IconButton(
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh),
          ),
          const SearchButton()
        ],
      ),
      body: state.when(
        loading: (_) => const _Loading(),
        data: (_, ids) => _Data(
          ids,
          onRefresh: () async => onRefresh(),
        ),
        error: (_, f) => _Error(f.message),
      ),
      bottomNavigationBar: MyNavBar(
        currentIndex: currentIndex,
        onTap: (index) => onNavigate,
      ),
    );
    ;
  }
}

class _Data extends StatelessWidget {
  const _Data(this.ids, {required this.onRefresh});
  final List<int> ids;
  final Future<void> Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: ids.length,
        itemBuilder: (ctx, index) {
          final id = ids[index];
          return StoryTile(id);
        },
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _Error extends StatelessWidget {
  const _Error(this.message);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}
