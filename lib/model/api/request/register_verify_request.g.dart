// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_verify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterVerifyRequest _$RegisterVerifyRequestFromJson(
    Map<String, dynamic> json) {
  return RegisterVerifyRequest(
    emailOrPhone: json['email_or_phone'] as String,
    otpCode: json['otp_code'] as String,
  );
}

Map<String, dynamic> _$RegisterVerifyRequestToJson(
        RegisterVerifyRequest instance) =>
    <String, dynamic>{
      'email_or_phone': instance.emailOrPhone,
      'otp_code': instance.otpCode,
    };
