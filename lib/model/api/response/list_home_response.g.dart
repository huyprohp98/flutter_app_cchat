// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListHomeResponse _$ListHomeResponseFromJson(Map<String, dynamic> json) {
  return ListHomeResponse(
    json['data'] == null
        ? null
        : HomeListData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$ListHomeResponseToJson(ListHomeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
