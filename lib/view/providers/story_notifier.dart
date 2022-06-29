import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/repository/repository.dart';
import 'package:hn_client/view/providers/item_state.dart';

import 'item_notifier.dart';
import 'story_state.dart';

final storyFamily =
    StateNotifierProvider.family<StoryNotifier, StoryState, int>(
  (ref, id) {
    final repository = ref.read(repositoryProvider);
    final item = ref.watch(itemFamily(id));
    return StoryNotifier(id: id, repository: repository, item: item);
  },
);

class StoryNotifier extends StateNotifier<StoryState> {
  final int id;
  final Repository repository;
  final ItemState item;
  StoryNotifier({
    required this.id,
    required this.repository,
    required this.item,
  }) : super(StoryState(item, false)) {
    load();
  }

  Future<void> load() async {
    if (!mounted) return;
    final url = item.maybeWhen(
      data: (itemData) {
        return itemData.url;
      },
      orElse: () => null,
    );
    if (url == null) return;
    final visited = await repository.isLinkVisited(url);
    state = StoryState(item, visited);
  }

  Future<void> visitUrl() async {
    final url = item.maybeWhen(
      data: (itemData) {
        return itemData.url;
      },
      orElse: () => null,
    );
    if (url == null) return;
    await repository.setLinkVisited(url);
    state = StoryState(state.item, true);
  }
}
