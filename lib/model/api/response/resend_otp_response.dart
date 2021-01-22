import 'package:flutter_app_cchat/model/api/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_response.g.dart';

@JsonSerializable()
class ResendOtpResponse extends BaseResponse {
  ResendOtpResponse();

  factory ResendOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResendOtpResponseToJson(this);
}
