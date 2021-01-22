// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRegisterResponse _$LoginRegisterResponseFromJson(
    Map<String, dynamic> json) {
  return LoginRegisterResponse(
    json['data'] == null
        ? null
        : LoginRegisterData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$LoginRegisterResponseToJson(
        LoginRegisterResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
