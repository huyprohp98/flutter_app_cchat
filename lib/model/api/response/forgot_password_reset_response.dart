
import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';

part 'forgot_password_reset_response.g.dart';

@JsonSerializable()
class ForgotPasswordResetResponse extends BaseResponse {
  ForgotPasswordResetResponse();

  factory ForgotPasswordResetResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordResetResponseToJson(this);
}
