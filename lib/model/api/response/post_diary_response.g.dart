// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_diary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDiaryResponse _$PostDiaryResponseFromJson(Map<String, dynamic> json) {
  return PostDiaryResponse()
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$PostDiaryResponseToJson(PostDiaryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
