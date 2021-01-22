// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_register_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRegisterData _$LoginRegisterDataFromJson(Map<String, dynamic> json) {
  return LoginRegisterData(
    token: json['token'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginRegisterDataToJson(LoginRegisterData instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };
