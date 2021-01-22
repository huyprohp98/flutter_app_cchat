// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailList _$ProductDetailListFromJson(Map<String, dynamic> json) {
  return ProductDetailList(
    json['product'] == null
        ? null
        : CategoryProductHotData.fromJson(
            json['product'] as Map<String, dynamic>),
    (json['related_product'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryProductHotData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProductDetailListToJson(ProductDetailList instance) =>
    <String, dynamic>{
      'product': instance.product,
      'related_product': instance.relatedProduct,
    };
