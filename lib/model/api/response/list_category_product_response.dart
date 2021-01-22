import 'package:flutter_app_cchat/model/api/response/base_response.dart';
import 'package:flutter_app_cchat/model/entity/banner.dart';
import 'package:flutter_app_cchat/model/entity/category_product_list.dart';
import 'package:flutter_app_cchat/model/entity/list_banner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_category_product_response.g.dart';

@JsonSerializable()
class ListCategoryProductResponse extends BaseResponse {
  @JsonKey(name: "data")
  CategoryProductList data;

  ListCategoryProductResponse(this.data);

  factory ListCategoryProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCategoryProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListCategoryProductResponseToJson(this);
}
