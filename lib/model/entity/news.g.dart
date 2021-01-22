// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
    json['id'] as int,
    json['user_id'] as int,
    json['name'] as String,
    json['avatar'] as String,
    json['content'] as String,
    (json['image'] as List)?.map((e) => e as String)?.toList(),
    json['created_at'] as String,
    json['likeCount'] as int,
    json['isLike'] as int,
    json['commentCount'] as int,
    json['share'],
  );
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'avatar': instance.avatar,
      'content': instance.content,
      'image': instance.image,
      'created_at': instance.createdAt,
      'likeCount': instance.likeCount,
      'isLike': instance.isLike,
      'commentCount': instance.commentCount,
      'share': instance.share,
    };
