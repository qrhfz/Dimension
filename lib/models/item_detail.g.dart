// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemDetail _$$_ItemDetailFromJson(Map<String, dynamic> json) =>
    _$_ItemDetail(
      id: json['id'] as int,
      author: json['author'] as String? ?? '',
      createdAt: DateTime.parse(json['created_at'] as String),
      title: json['title'] as String?,
      body: json['text'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => ItemDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentId: json['parent_id'] as int?,
      storyId: json['story_id'] as int?,
      url: json['url'] as String?,
      score: json['points'] as int?,
      collapsed: json['collapsed'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ItemDetailToJson(_$_ItemDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'created_at': instance.createdAt.toIso8601String(),
      'title': instance.title,
      'text': instance.body,
      'children': instance.children,
      'parent_id': instance.parentId,
      'story_id': instance.storyId,
      'url': instance.url,
      'points': instance.score,
      'collapsed': instance.collapsed,
    };
