// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      id: json['id'] as int,
      author: json['by'] as String,
      createdAt: secondsFromEpochToDateTime(json['time'] as int),
      type: $enumDecode(_$ItemTypeEnumMap, json['type']),
      isDeleted: json['deleted'] as bool?,
      isDead: json['dead'] as bool?,
      pollId: json['poll'] as int?,
      title: json['title'] as String?,
      body: json['text'] as String?,
      childrenIds:
          (json['kids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      pollOptIds:
          (json['parts'] as List<dynamic>?)?.map((e) => e as int).toList(),
      parentId: json['parent'] as int?,
      url: json['url'] as String?,
      score: json['score'] as int?,
      descendantCount: json['descendants'] as int?,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'by': instance.author,
      'time': instance.createdAt.toIso8601String(),
      'type': _$ItemTypeEnumMap[instance.type],
      'deleted': instance.isDeleted,
      'dead': instance.isDead,
      'poll': instance.pollId,
      'title': instance.title,
      'text': instance.body,
      'kids': instance.childrenIds,
      'parts': instance.pollOptIds,
      'parent': instance.parentId,
      'url': instance.url,
      'score': instance.score,
      'descendants': instance.descendantCount,
    };

const _$ItemTypeEnumMap = {
  ItemType.job: 'job',
  ItemType.story: 'story',
  ItemType.comment: 'comment',
  ItemType.poll: 'poll',
  ItemType.pollopt: 'pollopt',
};
