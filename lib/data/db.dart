import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/item.dart';

final dbProvider = Provider((_) => DB());

class DB {
  Future<List<int>> getNewStoryIds() {
    throw UnimplementedError();
  }

  Future<List<int>> getTopStoryIds() {
    throw UnimplementedError();
  }

  Future<List<int>> getBestStoryIds() {
    throw UnimplementedError();
  }

  Future<List<int>> getAskStoryIds() {
    throw UnimplementedError();
  }

  Future<List<int>> getShowStoryIds() {
    throw UnimplementedError();
  }

  Future<List<int>> getJobStoryIds() {
    throw UnimplementedError();
  }

  Future<Item> getItem(int id) {
    throw UnimplementedError();
  }

  Future<List<int>> setNewStoryIds(List<int> ids) {
    throw UnimplementedError();
  }

  Future<List<int>> setTopStoryIds(List<int> ids) {
    throw UnimplementedError();
  }

  Future<List<int>> setBestStoryIds(List<int> ids) {
    throw UnimplementedError();
  }

  Future<List<int>> setAskStoryIds(List<int> ids) {
    throw UnimplementedError();
  }

  Future<List<int>> setShowStoryIds(List<int> ids) {
    throw UnimplementedError();
  }

  Future<List<int>> setJobStoryIds(List<int> ids) {
    throw UnimplementedError();
  }

  Future<Item> setItem(Item item) {
    throw UnimplementedError();
  }
}
