// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_category_product_best_new_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryProductBestNewResponse _$CategoryProductBestNewResponseFromJson(
    Map<String, dynamic> json) {
  return CategoryProductBestNewResponse(
    json['data'] == null
        ? null
        : ListCategoryProductHotNewBestData.fromJson(
            json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$CategoryProductBestNewResponseToJson(
        CategoryProductBestNewResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
