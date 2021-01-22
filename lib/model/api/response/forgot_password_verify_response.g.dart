// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordVerifyResponse _$ForgotPasswordVerifyResponseFromJson(
    Map<String, dynamic> json) {
  return ForgotPasswordVerifyResponse()
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$ForgotPasswordVerifyResponseToJson(
        ForgotPasswordVerifyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
