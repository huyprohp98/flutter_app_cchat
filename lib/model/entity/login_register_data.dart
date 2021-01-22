import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_register_data.g.dart';

@JsonSerializable()
class LoginRegisterData extends Equatable {
  String token;
  User user;

  LoginRegisterData({this.token, this.user});

  factory LoginRegisterData.fromJson(Map<String, dynamic> json) =>
      _$LoginRegisterDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRegisterDataToJson(this);

  @override
  List<Object> get props => [token, user];

  @override
  String toString() {
    return 'LoginRegisterData{token: $token, user: $user}';
  }
}
