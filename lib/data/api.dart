import 'dart:convert';

import 'package:dimension/data/api_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/models/item_detail.dart';
import '/models/user.dart';

import '../home/search/search_item.dart';
import '../models/item.dart';
import 'package:http/http.dart' as http;

final apiProvider = Provider((_) => API(http.Client()));

class API {
  final http.Client client;

  static const authority = 'hacker-news.firebaseio.com';

  API(this.client);

  Future<List<int>> getNewStoryIds() async {
    final response =
        await client.get(Uri.https(API.authority, '/v0/newstories.json'));
    final List<int> ids = List<int>.from(jsonDecode(response.body));
    return ids;
  }

  Future<List<int>> getTopStoryIds() async {
    final response =
        await client.get(Uri.https(API.authority, '/v0/topstories.json'));
    final List<int> ids = List<int>.from(jsonDecode(response.body));
    return ids;
  }

  Future<List<int>> getBestStoryIds() async {
    final response =
        await client.get(Uri.https(API.authority, '/v0/beststories.json'));
    final List<int> ids = List<int>.from(jsonDecode(response.body));
    return ids;
  }

  Future<List<int>> getAskStoryIds() async {
    final response =
        await client.get(Uri.https(API.authority, '/v0/askstories.json'));
    final List<int> ids = List<int>.from(jsonDecode(response.body));
    return ids;
  }

  Future<List<int>> getShowStoryIds() async {
    final response =
        await client.get(Uri.https(API.authority, '/v0/showstories.json'));
    final List<int> ids = List<int>.from(jsonDecode(response.body));
    return ids;
  }

  Future<List<int>> getJobStoryIds() async {
    final response =
        await client.get(Uri.https(API.authority, '/v0/jobstories.json'));
    final List<int> ids = List<int>.from(jsonDecode(response.body));
    return ids;
  }

  Future<Item> getItem(int id) async {
    final response =
        await client.get(Uri.https(authority, '/v0/item/$id.json'));
    final Map<String, dynamic> json = jsonDecode(response.body);
    return Item.fromJson(json);
  }

  Future<ItemDetail> getItemDetail(int id) async {
    final response =
        await client.get(Uri.https('hn.algolia.com', '/api/v1/items/$id'));

    if (response.statusCode == 404) {
      throw ItemNotFoundException();
    }
    final Map<String, dynamic> json = jsonDecode(response.body);
    return ItemDetail.fromJson(json);
  }

  Future<User> getUser(String id) {
    throw UnimplementedError();
  }

  Future<List<SearchItem>> search(String query, bool searchMode,
      [int page = 0]) async {
    final String path =
        searchMode ? '/api/v1/search_by_date' : '/api/v1/search';
    final url = Uri.https(
      'hn.algolia.com',
      path,
      {
        'query': query,
        'tags': 'story',
        'page': '$page',
      },
    );

    final response = await client.get(url);

    final Map<String, dynamic> json = jsonDecode(response.body);
    final hits =
        (json['hits'] as List).map((e) => e as Map<String, dynamic>).toList();

    final nbPages = json['nbPages'] as int;
    if (page > nbPages) {
      throw Exception("search overflow");
    }

    return hits.map((e) => SearchItem.fromJson(e)).toList();
  }
}
