import 'package:flutter_app_cchat/model/entity/home_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'base_response.dart';

part 'home_page_response.g.dart';

@JsonSerializable()
class HomePageResponse extends BaseResponse {
  HomeData data;

  HomePageResponse(this.data);

  factory HomePageResponse.fromJson(Map<String, dynamic> json) =>
      _$HomePageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomePageResponseToJson(this);
}
