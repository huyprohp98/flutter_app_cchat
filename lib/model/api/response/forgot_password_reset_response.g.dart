// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_reset_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordResetResponse _$ForgotPasswordResetResponseFromJson(
    Map<String, dynamic> json) {
  return ForgotPasswordResetResponse()
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$ForgotPasswordResetResponseToJson(
        ForgotPasswordResetResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
