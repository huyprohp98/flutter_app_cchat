import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category_product_hot.dart';

part 'product_by_attr_data.g.dart';

@JsonSerializable()
class ProductByAttrData extends Equatable {
  List<CategoryProductHotData> list;

  ProductByAttrData(this.list);

  factory ProductByAttrData.fromJson(Map<String, dynamic> json) =>
      _$ProductByAttrDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductByAttrDataToJson(this);

  @override
  List<Object> get props => [list];
}
