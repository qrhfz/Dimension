import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/models/failure.dart';
import 'package:hn_client/view/providers/home_notifier.dart';
import 'package:hn_client/view/providers/home_state.dart';
import 'package:hn_client/view/widgets/story_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(homeNotifierProvider);
    final notifier = ref.read(homeNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(state.contentType.name),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.filter_list_rounded),
            initialValue: state.contentType,
            itemBuilder: (ctx) => const [
              PopupMenuItem<HomeContentType>(
                child: Text("Top"),
                value: HomeContentType.top,
              ),
              PopupMenuItem<HomeContentType>(
                child: Text("Best"),
                value: HomeContentType.best,
              ),
              PopupMenuItem<HomeContentType>(
                child: Text("New"),
                value: HomeContentType.new_,
              ),
              PopupMenuItem<HomeContentType>(
                child: Text("Ask"),
                value: HomeContentType.ask,
              ),
              PopupMenuItem<HomeContentType>(
                child: Text("Show"),
                value: HomeContentType.show,
              ),
              PopupMenuItem<HomeContentType>(
                child: Text("Job"),
                value: HomeContentType.job,
              ),
            ],
            onSelected: (HomeContentType type) {
              notifier.load(type);
            },
          )
        ],
      ),
      body: state.when(
        loading: loading,
        data: data,
        error: error,
      ),
    );
  }

  Widget loading(_) => const Center(child: CircularProgressIndicator());
  Widget data(_, List<int> ids) {
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
