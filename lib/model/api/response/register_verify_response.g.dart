// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterVerifyResponse _$RegisterVerifyResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterVerifyResponse()
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$RegisterVerifyResponseToJson(
        RegisterVerifyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
