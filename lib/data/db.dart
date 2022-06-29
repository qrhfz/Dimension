import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/item.dart';
import '../models/visited_link.dart';

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
      schemas: [VisitedLinkSchema],
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

  Future<bool> isLinkVisited(String url) async {
    final count = await isar.visitedLinks.where().urlEqualTo(url).count();
    return count == 1;
  }

  Future<void> setLinkVisited(String url) async {
    final newLink = VisitedLink()..url = url;
    isar.writeTxn((isar) async {
      await isar.visitedLinks.put(newLink);
    });
  }
}
