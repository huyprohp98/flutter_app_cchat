import 'dart:ffi';

import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_cchat/model/entity/sizes.dart';
import 'package:json_annotation/json_annotation.dart';

import 'attr_qty_category_product_hot.dart';
import 'category_product_hot.dart';
import 'color_catergory_product_hot.dart';

part 'list_category_product_new_best.g.dart';

@JsonSerializable()
class ListCategoryProductHotNewBestData extends Equatable {
  @JsonKey(name: "list")
  List<Product> listBestNew;

  ListCategoryProductHotNewBestData(this.listBestNew);

  factory ListCategoryProductHotNewBestData.fromJson(
          Map<String, dynamic> json) =>
      _$ListCategoryProductHotNewBestDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ListCategoryProductHotNewBestDataToJson(this);

  @override
  List<Object> get props => [
        listBestNew,
      ];
  @override
  String toString() {
    return 'ListCategoryProductHotNewBestData{listBestNew: $listBestNew,}';
  }
}
