import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/detail_news.dart';
import 'package:json_annotation/json_annotation.dart';
import 'base_response.dart';

part 'detail_new_response.g.dart';

@JsonSerializable()
class DetailNewResponse extends BaseResponse {
  DetailNews data;

  DetailNewResponse(this.data);

  factory DetailNewResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailNewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailNewResponseToJson(this);
}
