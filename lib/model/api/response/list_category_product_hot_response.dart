import 'package:flutter_app_cchat/model/api/response/base_response.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/list_category_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/news_data_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_category_product_hot_response.g.dart';

@JsonSerializable()
class CategoryProductHotResponse extends BaseResponse {
  ListCategoryProductHotData data;

  CategoryProductHotResponse(this.data);

  factory CategoryProductHotResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductHotResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryProductHotResponseToJson(this);
}
