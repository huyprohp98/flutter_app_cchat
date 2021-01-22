// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_by_attr_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductByAttrResponse _$ProductByAttrResponseFromJson(
    Map<String, dynamic> json) {
  return ProductByAttrResponse(
    data: json['data'] == null
        ? null
        : ProductByAttrData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$ProductByAttrResponseToJson(
        ProductByAttrResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
