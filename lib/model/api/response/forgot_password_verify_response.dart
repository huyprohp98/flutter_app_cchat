
import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';

part 'forgot_password_verify_response.g.dart';

@JsonSerializable()
class ForgotPasswordVerifyResponse extends BaseResponse {

  ForgotPasswordVerifyResponse();

  factory ForgotPasswordVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordVerifyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordVerifyResponseToJson(this);

}
