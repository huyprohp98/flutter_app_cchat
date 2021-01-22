import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_reset_request.g.dart';
@JsonSerializable()
class ForgotPasswordResetRequest {
  @JsonKey(name: "email_or_phone")
  final String emailOrPhone;
  @JsonKey(name: "otp_code")
  final String otpCode;
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "confirm_password")
  final String confirmPassword;


  ForgotPasswordResetRequest(
      {this.emailOrPhone, this.otpCode, this.password, this.confirmPassword});

  factory ForgotPasswordResetRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResetRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordResetRequestToJson(this);
}