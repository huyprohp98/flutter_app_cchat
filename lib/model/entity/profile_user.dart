import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_user.g.dart';

@JsonSerializable()
class ProfileUserData extends Equatable {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "phone_number")
  String phone;
  @JsonKey(name: "avatar")
  String avatar;
  @JsonKey(name: "background_image")
  List<String> image;
  @JsonKey(name: "date_of_birth")
  String date;
  @JsonKey(name: "point")
  int point;
  @JsonKey(name: "currentRanking")
  int currentRanking;
  ProfileUserData(
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.image,
    this.date,
    this.point,
    this.currentRanking,
  );

  factory ProfileUserData.fromJson(Map<String, dynamic> json) =>
      _$ProfileUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileUserDataToJson(this);

  @override
  List<Object> get props =>
      [name, email, phone, avatar, image, date, point, currentRanking];

  @override
  String toString() {
    return 'ProfileUserData{name: $name, email: $email,phone: $phone, avatar: $avatar, image: $image,date:$date,point: $point, currentRanking:$currentRanking  }';
  }
}
