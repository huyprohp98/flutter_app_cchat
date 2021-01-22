// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_app_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginAppRequest _$LoginAppRequestFromJson(Map<String, dynamic> json) {
  return LoginAppRequest(
    emailOrPhone: json['email_or_phone'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$LoginAppRequestToJson(LoginAppRequest instance) =>
    <String, dynamic>{
      'email_or_phone': instance.emailOrPhone,
      'password': instance.password,
    };
