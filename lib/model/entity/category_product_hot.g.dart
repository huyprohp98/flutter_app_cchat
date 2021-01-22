// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_product_hot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryProductHotData _$CategoryProductHotDataFromJson(
    Map<String, dynamic> json) {
  return CategoryProductHotData(
    json['id'] as int,
    json['name'] as String,
    json['product_code'] as String,
    json['price'] as int,
    json['sale_price'] as int,
    json['qty'] as int,
    json['is_sale'] as int,
    json['link_share'] as String,
    json['is_attr'] as int,
    json['percent_off'] as int,
    (json['image'] as List)?.map((e) => e as String)?.toList(),
    json['detail_product'] as String,
    json['is_like'] as int,
    json['average_number_of_stars'] as int,
    json['category_id'] as int,
    (json['size'] as List)
        ?.map(
            (e) => e == null ? null : Sizes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['attr_qty'] as List)
        ?.map((e) =>
            e == null ? null : AttrQty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['color'] as List)
        ?.map((e) => e == null
            ? null
            : ColorCatergoryProductHot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['product_mix_match'] as String,
  );
}

Map<String, dynamic> _$CategoryProductHotDataToJson(
        CategoryProductHotData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'product_code': instance.productCode,
      'price': instance.price,
      'sale_price': instance.salePrice,
      'qty': instance.qty,
      'is_sale': instance.isSale,
      'link_share': instance.linkShare,
      'is_attr': instance.isAttr,
      'percent_off': instance.percentOff,
      'image': instance.image,
      'detail_product': instance.detailProduct,
      'is_like': instance.isLike,
      'average_number_of_stars': instance.averageNumberOfStars,
      'category_id': instance.categoryId,
      'size': instance.size,
      'attr_qty': instance.attrQty,
      'color': instance.color,
      'product_mix_match': instance.productMixMatch,
    };
