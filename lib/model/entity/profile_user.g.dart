// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUserData _$ProfileUserDataFromJson(Map<String, dynamic> json) {
  return ProfileUserData(
    json['name'] as String,
    json['email'] as String,
    json['phone_number'] as String,
    json['avatar'] as String,
    (json['background_image'] as List)?.map((e) => e as String)?.toList(),
    json['date_of_birth'] as String,
    json['point'] as int,
    json['currentRanking'] as int,
  );
}

Map<String, dynamic> _$ProfileUserDataToJson(ProfileUserData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phone,
      'avatar': instance.avatar,
      'background_image': instance.image,
      'date_of_birth': instance.date,
      'point': instance.point,
      'currentRanking': instance.currentRanking,
    };
