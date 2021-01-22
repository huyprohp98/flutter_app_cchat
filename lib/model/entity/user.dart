import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "phone_number")
  String phoneNumber;
  @JsonKey(name: "gender")
  int gender;
  @JsonKey(name: "member_code")
  String memberCode;
  @JsonKey(name: "avatar")
  String avatar;
  @JsonKey(name: "background_image")
  String backgroundImage;
  @JsonKey(name: "address")
  String address;
  @JsonKey(name: "province_id")
  int provinceId;
  @JsonKey(name: "district_id")
  int districtId;
  @JsonKey(name: "latitude")
  double latitude;
  @JsonKey(name: "longitude")
  double longitude;
  @JsonKey(name: "social_id")
  int socialId;
  @JsonKey(name: "type")
  int type;
  @JsonKey(name: "role_id")
  int roleId;
  @JsonKey(name: "type_register")
  int typeRegister;
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "device_identifier")
  String deviceIdentifier;
  @JsonKey(name: "expire_at")
  String expireAt;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "updated_at")
  String updatedAt;


  User(
      this.id,
      this.name,
      this.username,
      this.email,
      this.phoneNumber,
      this.gender,
      this.memberCode,
      this.avatar,
      this.backgroundImage,
      this.address,
      this.provinceId,
      this.districtId,
      this.latitude,
      this.longitude,
      this.socialId,
      this.type,
      this.roleId,
      this.typeRegister,
      this.status,
      this.deviceIdentifier,
      this.expireAt,
      this.createdAt,
      this.updatedAt
      );

  @override
  String toString() {
    return 'User{id: $id, name: $name,username: $username,email: $email,phoneNumber: $phoneNumber, gender: $gender, memberCode: $memberCode,avatar: $avatar,'
        'backgroundImage: $backgroundImage, address: $address, provinceId: $provinceId, districtId: $districtId,latitude: $latitude,longitude: $longitude, '
        'socialId: $socialId, type: $type, roleId: $roleId,typeRegister: $typeRegister, status: $status, deviceIdentifier: $deviceIdentifier,'
        'expireAt: $expireAt, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => [
    id,
    name,
    username,
    email,
    phoneNumber,
    gender,
    memberCode,
    avatar,
    backgroundImage,
    address,
    provinceId,
    districtId,
    latitude,
    longitude,
    socialId,
    type,
    roleId,
    typeRegister,
    status,
    deviceIdentifier,
    expireAt,
    createdAt,
    updatedAt
  ];
}
