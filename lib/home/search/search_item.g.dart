// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchItem _$$_SearchItemFromJson(Map<String, dynamic> json) =>
    _$_SearchItem(
      id: int.parse(json['objectID'] as String),
      author: json['author'] as String? ?? '',
      createdAt: DateTime.parse(json['created_at'] as String),
      title: json['title'] as String?,
      url: json['url'] as String?,
      score: json['points'] as int?,
    );

Map<String, dynamic> _$$_SearchItemToJson(_$_SearchItem instance) =>
    <String, dynamic>{
      'objectID': instance.id,
      'author': instance.author,
      'created_at': instance.createdAt.toIso8601String(),
      'title': instance.title,
      'url': instance.url,
      'points': instance.score,
    };
