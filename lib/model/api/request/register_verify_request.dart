import 'package:json_annotation/json_annotation.dart';

part 'register_verify_request.g.dart';
@JsonSerializable()
class RegisterVerifyRequest {
  @JsonKey(name: "email_or_phone")
  final String emailOrPhone;
  @JsonKey(name: "otp_code")
  final String otpCode;

  RegisterVerifyRequest({this.emailOrPhone, this.otpCode});

  factory RegisterVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterVerifyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterVerifyRequestToJson(this);
}