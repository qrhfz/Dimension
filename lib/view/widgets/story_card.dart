import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/view/providers/item_notifier.dart';

class StoryCard extends ConsumerWidget {
  final int id;
  const StoryCard(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final notifier = ref.read(itemFamily(id).notifier);
    final state = ref.watch(itemFamily(id));

    notifier.load();
    return state.when(
      loading: () => const SizedBox(height: 64),
      data: (item) => ListTile(
        title: Text(item.title ?? ""),
        subtitle: Text(item.url ?? ""),
      ),
      error: (message) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(message),
      ),
    );
  }
}
