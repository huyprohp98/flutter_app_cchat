// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_new_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailNewResponse _$DetailNewResponseFromJson(Map<String, dynamic> json) {
  return DetailNewResponse(
    json['data'] == null
        ? null
        : DetailNews.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$DetailNewResponseToJson(DetailNewResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
