import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_verify_request.g.dart';
@JsonSerializable()
class ForgotPasswordVerifyRequest {
  @JsonKey(name: "email_or_phone")
  final String emailOrPhone;
  @JsonKey(name: "otp_code")
  final String otpCode;

  ForgotPasswordVerifyRequest({this.emailOrPhone, this.otpCode});

  factory ForgotPasswordVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordVerifyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordVerifyRequestToJson(this);
}