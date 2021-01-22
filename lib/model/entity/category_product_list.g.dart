// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_product_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryProductList _$CategoryProductListFromJson(Map<String, dynamic> json) {
  return CategoryProductList(
    (json['category_product'] as List)
        ?.map((e) =>
            e == null ? null : Category.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoryProductListToJson(
        CategoryProductList instance) =>
    <String, dynamic>{
      'category_product': instance.categoryProduct,
    };
