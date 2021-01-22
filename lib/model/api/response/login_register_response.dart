import 'package:flutter_app_cchat/model/api/response/barrel_response.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_register_response.g.dart';

@JsonSerializable()
class LoginRegisterResponse extends BaseResponse {
  LoginRegisterData data;

  LoginRegisterResponse(this.data);

  factory LoginRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginRegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRegisterResponseToJson(this);

  @override
  List<Object> get props => [data];

  @override
  String toString() {
    return 'LoginRegisterResponse{data: $data}';
  }
}
