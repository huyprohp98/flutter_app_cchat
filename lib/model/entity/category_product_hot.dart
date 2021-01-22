import 'dart:ffi';

import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_cchat/model/entity/sizes.dart';
import 'package:json_annotation/json_annotation.dart';

import 'attr_qty_category_product_hot.dart';
import 'color_catergory_product_hot.dart';

part 'category_product_hot.g.dart';

@JsonSerializable()
class CategoryProductHotData extends Equatable {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "product_code")
  String productCode;
  @JsonKey(name: "price")
  int price;
  @JsonKey(name: "sale_price")
  int salePrice;
  @JsonKey(name: "qty")
  int qty;
  @JsonKey(name: "is_sale")
  int isSale;
  @JsonKey(name: "link_share")
  String linkShare;
  @JsonKey(name: "is_attr")
  int isAttr;
  @JsonKey(name: "percent_off")
  int percentOff;
  @JsonKey(name: "image")
  List<String> image;
  @JsonKey(name: "detail_product")
  String detailProduct;
  @JsonKey(name: "is_like")
  int isLike;
  @JsonKey(name: "average_number_of_stars")
  int averageNumberOfStars;
  @JsonKey(name: "category_id")
  int categoryId;
  @JsonKey(name: "size")
  List<Sizes> size;
  @JsonKey(name: "attr_qty")
  List<AttrQty> attrQty;
  @JsonKey(name: "color")
  List<ColorCatergoryProductHot> color;
  @JsonKey(name: "product_mix_match")
  String productMixMatch;

  CategoryProductHotData(this.id,this.name,this.productCode,this.price,this.salePrice,this.qty,this.isSale,this.linkShare,this.isAttr,this.percentOff,this.image,this.detailProduct,this.isLike,this.averageNumberOfStars,this.categoryId,this.size,this.attrQty,this.color,this.productMixMatch);

  factory CategoryProductHotData.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductHotDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryProductHotDataToJson(this);

  @override
  List<Object> get props => [id,name,productCode,price,salePrice,qty,isSale,linkShare,isAttr,percentOff,image,detailProduct,isLike,averageNumberOfStars,categoryId,size,attrQty,color,productMixMatch];
  @override
  String toString() {
    return 'CategoryProductHotData{id: $id, name: $name, productCode: $productCode,price: $price,salePrice: $salePrice,qty: $qty,isSale:$isSale,linkShare:$linkShare,isAttr:$isAttr,percentOff:$percentOff,image:$image,detailProduct:$detailProduct,isLike:$isLike,averageNumberOfStars:$averageNumberOfStars,categoryId:$categoryId,size:$size,attrQty:$attrQty,color:$color,productMixMatch:$productMixMatch}';
  }
}
