import 'package:flutter_app_cchat/model/api/response/base_response.dart';
import 'package:flutter_app_cchat/model/entity/banner.dart';
import 'package:flutter_app_cchat/model/entity/list_banner.dart';
import 'package:flutter_app_cchat/model/entity/list_sizes.dart';
import 'package:flutter_app_cchat/model/entity/product_detail_list.dart';
import 'package:flutter_app_cchat/model/entity/sizes.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_detail_product.g.dart';

@JsonSerializable()
class DetailProductResponse extends BaseResponse {
  @JsonKey(name: "data")
  ProductDetailList data;

  DetailProductResponse(this.data);

  factory DetailProductResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailProductResponseToJson(this);
}
