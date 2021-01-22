import 'package:flutter_app_cchat/model/api/response/base_response.dart';
import 'package:flutter_app_cchat/model/entity/banner.dart';
import 'package:flutter_app_cchat/model/entity/list_banner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_banner_response.g.dart';

@JsonSerializable()
class ListBannerResponse extends BaseResponse {
  @JsonKey(name: "data")
  ListBanner data;

  ListBannerResponse(this.data);

  factory ListBannerResponse.fromJson(Map<String, dynamic> json) =>
      _$ListBannerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListBannerResponseToJson(this);
}
