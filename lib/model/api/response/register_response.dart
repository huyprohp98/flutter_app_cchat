import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse extends BaseResponse {

  RegisterResponse();

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

  @override
  List<Object> get props => [];

}
