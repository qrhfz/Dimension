import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/visited_story.dart';

final isarProvider = FutureProvider((ref) async {
  final dir = await getApplicationSupportDirectory();
  final isar = await Isar.open(
    schemas: [VisitedStorySchema],
    directory: dir.path,
  );
  return isar;
});

final dbProvider = Provider<DB>((ref) {
  final isar = ref.watch(isarProvider);
  return DB(isar);
});

class DB {
  DB(AsyncValue<Isar> isar) {
    this.isar = isar.whenOrNull();
  }

  late final Isar? isar;

  Future<bool> isLinkVisited(int id) async {
    final isar = this.isar;
    if (isar == null) {
      return false;
    }
    final count = await isar.visitedStories.where().itemIdEqualTo(id).count();
    return count == 1;
  }

  Future<void> setLinkVisited(int id) async {
    final isar = this.isar;
    if (isar == null) {
      return;
    }
    final item = VisitedStory()..itemId = id;
    final visited = await isLinkVisited(id);
    if (visited) return;
    isar.writeTxn((isar) async {
      await isar.visitedStories.put(item);
    });
  }
}
