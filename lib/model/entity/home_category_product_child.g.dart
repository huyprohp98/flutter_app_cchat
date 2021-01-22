// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_category_product_child.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCategoryProductChild _$ListCategoryProductChildFromJson(
    Map<String, dynamic> json) {
  return ListCategoryProductChild(
    json['id'] as int,
    json['image'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$ListCategoryProductChildToJson(
        ListCategoryProductChild instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
