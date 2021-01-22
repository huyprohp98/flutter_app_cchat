import 'package:flutter_app_cchat/model/api/response/base_response.dart';
import 'package:flutter_app_cchat/model/entity/banner.dart';
import 'package:flutter_app_cchat/model/entity/cart.dart';
import 'package:flutter_app_cchat/model/entity/list_banner.dart';
import 'package:flutter_app_cchat/model/entity/list_sizes.dart';
import 'package:flutter_app_cchat/model/entity/product_detail_list.dart';
import 'package:flutter_app_cchat/model/entity/sizes.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_add_product_in_cart.g.dart';

@JsonSerializable()
class AddProductInCartResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<Cart> data;

  AddProductInCartResponse(this.data);

  factory AddProductInCartResponse.fromJson(Map<String, dynamic> json) =>
      _$AddProductInCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddProductInCartResponseToJson(this);
}
