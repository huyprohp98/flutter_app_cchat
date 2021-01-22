import 'package:flutter_app_cchat/model/api/response/base_response.dart';
import 'package:flutter_app_cchat/model/entity/home_list_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_home_response.g.dart';

@JsonSerializable()
class ListHomeResponse extends BaseResponse {
  HomeListData data;

  ListHomeResponse(this.data);

  factory ListHomeResponse.fromJson(Map<String, dynamic> json) =>
      _$ListHomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListHomeResponseToJson(this);
}
