import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/models/item_detail.dart';
import 'package:hn_client/models/user.dart';

import '../models/item.dart';
import 'package:http/http.dart' as http;

import '../models/search_item.dart';

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
    final Map<String, dynamic> json = jsonDecode(response.body);
    return ItemDetail.fromJson(json);
  }

  Future<User> getUser(String id) {
    throw UnimplementedError();
  }

  Future<List<SearchItem>> search(String query) async {
    final response = await client.get(Uri.https(
      'hn.algolia.com',
      '/api/v1/search',
      {
        'query': query,
        'tags': 'story',
      },
    ));
    final Map<String, dynamic> json = jsonDecode(response.body);
    final hits =
        (json['hits'] as List).map((e) => e as Map<String, dynamic>).toList();

    return hits.map((e) => SearchItem.fromJson(e)).toList();
  }
}
