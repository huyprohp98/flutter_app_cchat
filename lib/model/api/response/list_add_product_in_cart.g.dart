// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_add_product_in_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductInCartResponse _$AddProductInCartResponseFromJson(
    Map<String, dynamic> json) {
  return AddProductInCartResponse(
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Cart.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$AddProductInCartResponseToJson(
        AddProductInCartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
