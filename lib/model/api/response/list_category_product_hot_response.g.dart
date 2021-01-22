// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_category_product_hot_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryProductHotResponse _$CategoryProductHotResponseFromJson(
    Map<String, dynamic> json) {
  return CategoryProductHotResponse(
    json['data'] == null
        ? null
        : ListCategoryProductHotData.fromJson(
            json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$CategoryProductHotResponseToJson(
        CategoryProductHotResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
