import 'package:flutter_app_cchat/model/api/response/barrel_response.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse extends BaseResponse {
  HomeData data;

  HomeResponse({this.data});

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);

}
