import 'package:flutter_app_cchat/model/api/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_verify_response.g.dart';

@JsonSerializable()
class RegisterVerifyResponse extends BaseResponse {
  RegisterVerifyResponse();

  factory RegisterVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterVerifyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterVerifyResponseToJson(this);
}
