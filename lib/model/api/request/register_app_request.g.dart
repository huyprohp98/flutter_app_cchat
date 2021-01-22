// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_app_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterAppRequest _$RegisterAppRequestFromJson(Map<String, dynamic> json) {
  return RegisterAppRequest(
    username: json['email_or_phone'] as String,
    password: json['password'] as String,
    confirmPassword: json['confirm_password'] as String,
  );
}

Map<String, dynamic> _$RegisterAppRequestToJson(RegisterAppRequest instance) =>
    <String, dynamic>{
      'email_or_phone': instance.username,
      'password': instance.password,
      'confirm_password': instance.confirmPassword,
    };
