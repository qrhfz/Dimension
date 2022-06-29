import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/visited_story.dart';

final dbProvider = Provider<DB>((ref) {
  return DB();
});

class DB {
  Isar? _isar;

  Isar get isar {
    if (_isar == null) {
      getIsar().then((value) => _isar = value);
      return _isar!;
    }
    return _isar!;
  }

  Future<Isar> getIsar() async {
    final dir = await getApplicationSupportDirectory();
    final isar = await Isar.open(
      schemas: [VisitedStorySchema],
      directory: dir.path,
    );
    return isar;
  }

  Future<void> init() async {
    _isar = await getIsar();
  }

  DB() {
    init();
  }

  Future<bool> isLinkVisited(int id) async {
    final count = await isar.visitedStories.where().itemIdEqualTo(id).count();
    return count == 1;
  }

  Future<void> setLinkVisited(int id) async {
    final item = VisitedStory()..itemId = id;
    final visited = await isLinkVisited(id);
    if (visited) return;
    isar.writeTxn((isar) async {
      await isar.visitedStories.put(item);
    });
  }
}
