// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int,
    json['name'] as String,
    json['username'] as String,
    json['email'] as String,
    json['phone_number'] as String,
    json['gender'] as int,
    json['member_code'] as String,
    json['avatar'] as String,
    json['background_image'] as String,
    json['address'] as String,
    json['province_id'] as int,
    json['district_id'] as int,
    (json['latitude'] as num)?.toDouble(),
    (json['longitude'] as num)?.toDouble(),
    json['social_id'] as int,
    json['type'] as int,
    json['role_id'] as int,
    json['type_register'] as int,
    json['status'] as int,
    json['device_identifier'] as String,
    json['expire_at'] as String,
    json['created_at'] as String,
    json['updated_at'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'gender': instance.gender,
      'member_code': instance.memberCode,
      'avatar': instance.avatar,
      'background_image': instance.backgroundImage,
      'address': instance.address,
      'province_id': instance.provinceId,
      'district_id': instance.districtId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'social_id': instance.socialId,
      'type': instance.type,
      'role_id': instance.roleId,
      'type_register': instance.typeRegister,
      'status': instance.status,
      'device_identifier': instance.deviceIdentifier,
      'expire_at': instance.expireAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
