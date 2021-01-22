// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) {
  return Cart(
    json['id'] as int,
    json['product_id'] as int,
    json['product_name'] as String,
    json['product_price'] as int,
    json['product_sale_price'] as int,
    json['is_sale'] as int,
    (json['product_image'] as List)?.map((e) => e as String)?.toList(),
    json['product_quantity'] as int,
    json['product_distribute'] as String,
  );
}

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_price': instance.productPrice,
      'product_sale_price': instance.productSalePrice,
      'is_sale': instance.isSale,
      'product_image': instance.productImage,
      'product_quantity': instance.productQuantity,
      'product_distribute': instance.productDistribute,
    };
