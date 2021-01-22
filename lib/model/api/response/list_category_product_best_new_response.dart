import 'package:flutter_app_cchat/model/api/response/base_response.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/list_category_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/list_category_product_new_best.dart';
import 'package:flutter_app_cchat/model/entity/news_data_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_category_product_best_new_response.g.dart';

@JsonSerializable()
class CategoryProductBestNewResponse extends BaseResponse {
  ListCategoryProductHotNewBestData data;

  CategoryProductBestNewResponse(this.data);

  factory CategoryProductBestNewResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductBestNewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryProductBestNewResponseToJson(this);
}
