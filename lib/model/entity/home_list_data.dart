import 'package:flutter_app_cchat/model/entity/home_list_banner.dart';
import 'package:flutter_app_cchat/model/entity/home_category_product.dart';
import 'package:flutter_app_cchat/model/entity/home_sizes.dart';
import 'package:flutter_app_cchat/model/entity/home_color.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_list_data.g.dart';

@JsonSerializable()
class HomeListData extends Equatable {
  @JsonKey(name: "list_banner")
  List<ListBanner> listBanner;

  @JsonKey(name: "category_product")
  List<ListCategoryProduct> category;

  @JsonKey(name: "sizes")
  List<HomeSizes> sizes;

  @JsonKey(name: "colors")
  List<HomeColors> colors;

  @JsonKey(name: "number_product_in_cart")
  int numberProductInCart;

  HomeListData(
      {this.listBanner,
      this.category,
      this.sizes,
      this.colors,
      this.numberProductInCart});

  factory HomeListData.fromJson(Map<String, dynamic> json) =>
      _$HomeListDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomeListDataToJson(this);

  @override
  List<Object> get props =>
      [listBanner, category, sizes, colors, numberProductInCart];
}
