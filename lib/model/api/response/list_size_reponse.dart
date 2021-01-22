import 'package:flutter_app_cchat/model/api/response/base_response.dart';
import 'package:flutter_app_cchat/model/entity/banner.dart';
import 'package:flutter_app_cchat/model/entity/list_banner.dart';
import 'package:flutter_app_cchat/model/entity/list_sizes.dart';
import 'package:flutter_app_cchat/model/entity/sizes.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_size_reponse.g.dart';

@JsonSerializable()
class ListSizeResponse extends BaseResponse {
  @JsonKey(name: "data")
  ListSize data;

  ListSizeResponse(this.data);

  factory ListSizeResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSizeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListSizeResponseToJson(this);
}
