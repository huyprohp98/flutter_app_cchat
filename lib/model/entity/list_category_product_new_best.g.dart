// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_category_product_new_best.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCategoryProductHotNewBestData _$ListCategoryProductHotNewBestDataFromJson(
    Map<String, dynamic> json) {
  return ListCategoryProductHotNewBestData(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListCategoryProductHotNewBestDataToJson(
        ListCategoryProductHotNewBestData instance) =>
    <String, dynamic>{
      'list': instance.listBestNew,
    };
