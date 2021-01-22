// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_category_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCategoryProductResponse _$ListCategoryProductResponseFromJson(
    Map<String, dynamic> json) {
  return ListCategoryProductResponse(
    json['data'] == null
        ? null
        : CategoryProductList.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$ListCategoryProductResponseToJson(
        ListCategoryProductResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
