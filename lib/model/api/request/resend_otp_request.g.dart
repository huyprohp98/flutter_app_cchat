// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendOtpRequest _$ResendOtpRequestFromJson(Map<String, dynamic> json) {
  return ResendOtpRequest(
    emailOrPhone: json['email_or_phone'] as String,
    type: json['type'] as int,
  );
}

Map<String, dynamic> _$ResendOtpRequestToJson(ResendOtpRequest instance) =>
    <String, dynamic>{
      'email_or_phone': instance.emailOrPhone,
      'type': instance.type,
    };
