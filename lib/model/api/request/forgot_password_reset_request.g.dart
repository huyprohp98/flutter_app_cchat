// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_reset_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordResetRequest _$ForgotPasswordResetRequestFromJson(
    Map<String, dynamic> json) {
  return ForgotPasswordResetRequest(
    emailOrPhone: json['email_or_phone'] as String,
    otpCode: json['otp_code'] as String,
    password: json['password'] as String,
    confirmPassword: json['confirm_password'] as String,
  );
}

Map<String, dynamic> _$ForgotPasswordResetRequestToJson(
        ForgotPasswordResetRequest instance) =>
    <String, dynamic>{
      'email_or_phone': instance.emailOrPhone,
      'otp_code': instance.otpCode,
      'password': instance.password,
      'confirm_password': instance.confirmPassword,
    };
