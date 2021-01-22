// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_detail_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailProductResponse _$DetailProductResponseFromJson(
    Map<String, dynamic> json) {
  return DetailProductResponse(
    json['data'] == null
        ? null
        : ProductDetailList.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$DetailProductResponseToJson(
        DetailProductResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
