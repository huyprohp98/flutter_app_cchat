// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendOtpResponse _$ResendOtpResponseFromJson(Map<String, dynamic> json) {
  return ResendOtpResponse()
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$ResendOtpResponseToJson(ResendOtpResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
