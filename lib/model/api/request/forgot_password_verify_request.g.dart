// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_verify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordVerifyRequest _$ForgotPasswordVerifyRequestFromJson(
    Map<String, dynamic> json) {
  return ForgotPasswordVerifyRequest(
    emailOrPhone: json['email_or_phone'] as String,
    otpCode: json['otp_code'] as String,
  );
}

Map<String, dynamic> _$ForgotPasswordVerifyRequestToJson(
        ForgotPasswordVerifyRequest instance) =>
    <String, dynamic>{
      'email_or_phone': instance.emailOrPhone,
      'otp_code': instance.otpCode,
    };
