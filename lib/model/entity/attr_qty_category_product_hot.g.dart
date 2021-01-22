// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attr_qty_category_product_hot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttrQty _$AttrQtyFromJson(Map<String, dynamic> json) {
  return AttrQty(
    json['size_id'] as int,
    json['size_name'] as String,
    json['color_id'] as int,
    json['color_name'] as String,
    json['quantity'] as int,
  );
}

Map<String, dynamic> _$AttrQtyToJson(AttrQty instance) => <String, dynamic>{
      'size_id': instance.sizeId,
      'size_name': instance.sizeName,
      'color_id': instance.colorId,
      'color_name': instance.colorName,
      'quantity': instance.quantity,
    };
