// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_size_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListSizeResponse _$ListSizeResponseFromJson(Map<String, dynamic> json) {
  return ListSizeResponse(
    json['data'] == null
        ? null
        : ListSize.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$ListSizeResponseToJson(ListSizeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
