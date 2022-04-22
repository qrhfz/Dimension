import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/models/failure.dart';
import 'package:hn_client/view/providers/home_notifier.dart';
import 'package:hn_client/view/widgets/story_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(homeNotifierProvider);
    final notifier = ref.read(homeNotifierProvider.notifier);
    notifier.load();
    return Scaffold(
      appBar: AppBar(),
      body: state.when(
        loading: loading,
        data: data,
        error: error,
      ),
    );
  }

  Widget loading() => const Center(child: CircularProgressIndicator());
  Widget data(List<int> ids) {
    return ListView.builder(
      itemCount: ids.length,
      itemBuilder: (ctx, index) {
        final id = ids[index];
        return StoryCard(id);
      },
    );
  }

  Widget error(Failure failure) {
    return Center(child: Text(failure.message));
  }
}
