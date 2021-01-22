// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_category_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCategoryProduct _$ListCategoryProductFromJson(Map<String, dynamic> json) {
  return ListCategoryProduct(
    json['id'] as int,
    json['name'] as String,
    json['image'] as String,
    (json['child'] as List)
        ?.map((e) => e == null
            ? null
            : ListCategoryProductChild.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListCategoryProductToJson(
        ListCategoryProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'child': instance.child,
    };
