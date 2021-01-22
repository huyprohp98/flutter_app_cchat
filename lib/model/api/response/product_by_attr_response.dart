import 'package:flutter_app_cchat/model/api/response/barrel_response.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/list_category_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/product_detail_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_by_attr_response.g.dart';

@JsonSerializable()
class ProductByAttrResponse extends BaseResponse {
  ProductByAttrData data;

  ProductByAttrResponse({this.data});

  factory ProductByAttrResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductByAttrResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductByAttrResponseToJson(this);

}
