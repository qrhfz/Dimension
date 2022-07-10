import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/models/failure.dart';
import 'package:hn_client/view/widgets/story_card.dart';

import '../providers/home/home_notifier.dart';
import '../providers/home/home_state.dart';
import '../widgets/my_bottom_nav.dart';
import '../widgets/my_nav_rail.dart';
import '../widgets/my_search_button.dart';

const homeContentTypes = [
  HomeContentType.top,
  HomeContentType.best,
  HomeContentType.new_,
  HomeContentType.ask,
  HomeContentType.show,
  HomeContentType.job
];

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

  void onIndexChange(int index, HomeNotifier notifier) {
    notifier.load(homeContentTypes[index]);
  }

  @override
  Widget build(context) {
    final state = ref.watch(homeNotifierProvider);
    final notifier = ref.read(homeNotifierProvider.notifier);
    final currentIndex = homeContentTypes.indexOf(state.contentType);

    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth >= 800) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.contentType.name),
            actions: const [SearchButton()],
          ),
          body: Row(
            children: [
              MyNavRail(
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
          actions: const [SearchButton()],
        ),
        body: state.when(
          loading: loading,
          data: data,
          error: error,
        ),
        bottomNavigationBar: MyNavBar(
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
