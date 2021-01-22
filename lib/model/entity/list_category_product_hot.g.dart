// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_category_product_hot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCategoryProductHotData _$ListCategoryProductHotDataFromJson(
    Map<String, dynamic> json) {
  return ListCategoryProductHotData(
    (json['list'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryProductHotData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListCategoryProductHotDataToJson(
        ListCategoryProductHotData instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
