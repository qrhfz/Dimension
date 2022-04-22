// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      createdAt: secondsFromEpochToDateTime(json['created'] as int),
      karma: json['karma'] as int,
      about: json['about'] as String?,
      submission:
          (json['submitted'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'created': instance.createdAt.toIso8601String(),
      'karma': instance.karma,
      'about': instance.about,
      'submitted': instance.submission,
    };
