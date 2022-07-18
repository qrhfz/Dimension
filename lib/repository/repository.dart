import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/data/api.dart';
import 'package:hn_client/models/failure.dart';
import 'package:hn_client/models/item.dart';
import 'package:dartz/dartz.dart';
import 'package:hn_client/models/item_detail.dart';
import '../data/db.dart';
import '../home/search/search_item.dart';

final repositoryProvider = Provider((ref) {
  final api = ref.read(apiProvider);
  final db = ref.read(dbProvider);
  return Repository(api: api, db: db);
});

class Repository {
  final API api;
  final DB db;

  const Repository({
    required this.api,
    required this.db,
  });

  Future<Either<Failure, List<int>>> getNewStoryIds() async {
    try {
      return right(await api.getNewStoryIds());
    } catch (e) {
      return left(NetworkFailure());
    }
  }

  Future<Either<Failure, List<int>>> getTopStoryIds() async {
    try {
      return right(await api.getTopStoryIds());
    } catch (e) {
      return left(NetworkFailure());
    }
  }

  Future<Either<Failure, List<int>>> getBestStoryIds() async {
    try {
      return right(await api.getBestStoryIds());
    } catch (e) {
      return left(NetworkFailure());
    }
  }

  Future<Either<Failure, List<int>>> getAskStoryIds() async {
    try {
      return right(await api.getAskStoryIds());
    } catch (e) {
      return left(NetworkFailure());
    }
  }

  Future<Either<Failure, List<int>>> getShowStoryIds() async {
    try {
      return right(await api.getShowStoryIds());
    } catch (e) {
      return left(NetworkFailure());
    }
  }

  Future<Either<Failure, List<int>>> getJobStoryIds() async {
    try {
      return right(await api.getJobStoryIds());
    } catch (e) {
      return left(NetworkFailure());
    }
  }

  Future<Either<Failure, Item>> getItem(int id) async {
    try {
      return right(await api.getItem(id));
    } catch (e) {
      return left(NetworkFailure());
    }
  }

  Future<Either<Failure, ItemDetail>> getItemDetail(int id) async {
    try {
      return right(await api.getItemDetail(id));
    } catch (e) {
      return left(NetworkFailure());
    }
  }

  Future<Either<Failure, List<SearchItem>>> search(
      String query, bool searchMode,
      [int page = 0]) async {
    try {
      return right(await api.search(query, searchMode, page));
    } catch (e) {
      return left(NetworkFailure(message: e.toString()));
    }
  }

  Future<bool> isLinkVisited(int id) async => db.isLinkVisited(id);

  Future<void> setLinkVisited(int id) async => db.setLinkVisited(id);
}
