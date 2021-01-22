import 'dart:ffi';

import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_cchat/model/entity/sizes.dart';
import 'package:json_annotation/json_annotation.dart';

import 'attr_qty_category_product_hot.dart';
import 'category_product_hot.dart';
import 'color_catergory_product_hot.dart';

part 'list_category_product_hot.g.dart';

@JsonSerializable()
class ListCategoryProductHotData extends Equatable {
  @JsonKey(name: "list")
  List<CategoryProductHotData> list;
  

  ListCategoryProductHotData(this.list);

  factory ListCategoryProductHotData.fromJson(Map<String, dynamic> json) =>
      _$ListCategoryProductHotDataFromJson(json);

  Map<String, dynamic> toJson() => _$ListCategoryProductHotDataToJson(this);

  @override
  List<Object> get props => [list,];
  @override
  String toString() {
    return 'ListCategoryProductHotData{list: $list,}';
  }
}
