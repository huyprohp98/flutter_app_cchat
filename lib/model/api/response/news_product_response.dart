import 'package:flutter_app_cchat/model/api/response/base_response.dart';
import 'package:flutter_app_cchat/model/entity/news_data_data.dart';
import 'package:flutter_app_cchat/model/entity/news_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_product_response.g.dart';

@JsonSerializable()
class NewsProductResponse extends BaseResponse {
  NewsList data;

  NewsProductResponse(this.data);

  factory NewsProductResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsProductResponseToJson(this);
}
