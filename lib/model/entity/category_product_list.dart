import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category.dart';

part 'category_product_list.g.dart';

@JsonSerializable()
class CategoryProductList extends Equatable {
  
  @JsonKey(name: "category_product")
  List<Category> categoryProduct;

  CategoryProductList(
      this.categoryProduct,
     );

  factory CategoryProductList.fromJson(Map<String, dynamic> json) => _$CategoryProductListFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryProductListToJson(this);

  @override
  List<Object> get props => [
        categoryProduct,

      ];

  @override
  String toString() {
    return 'CategoryProductList{categoryProduct: $categoryProduct,}';
  }
}
