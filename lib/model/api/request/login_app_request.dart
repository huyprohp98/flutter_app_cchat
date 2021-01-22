import 'package:json_annotation/json_annotation.dart';

part 'login_app_request.g.dart';

@JsonSerializable()
class LoginAppRequest {
  @JsonKey(name: "email_or_phone")
  final String emailOrPhone;
  @JsonKey(name: "password")
  final String password;

  LoginAppRequest({this.emailOrPhone, this.password});

  factory LoginAppRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginAppRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginAppRequestToJson(this);
}
