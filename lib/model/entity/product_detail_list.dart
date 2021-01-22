import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category_product_hot.dart';

part 'product_detail_list.g.dart';

@JsonSerializable()
class ProductDetailList extends Equatable {
  @JsonKey(name: "product")
  CategoryProductHotData product;
  @JsonKey(name: "related_product")
  List<CategoryProductHotData> relatedProduct;

  ProductDetailList(this.product,  this.relatedProduct);

  factory ProductDetailList.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailListFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailListToJson(this);

  @override
  List<Object> get props => [product, relatedProduct];

  @override
  String toString() {
    return 'ProductDetailList{product: $product, relatedProduct: $relatedProduct}';
  }
}
