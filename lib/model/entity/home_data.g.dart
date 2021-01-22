// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeData _$HomeDataFromJson(Map<String, dynamic> json) {
  return HomeData(
    listBanner: (json['list_banner'] as List)
        ?.map((e) =>
            e == null ? null : Banners.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    category: (json['category_product'] as List)
        ?.map((e) =>
            e == null ? null : Category.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sizes: (json['sizes'] as List)
        ?.map((e) =>
            e == null ? null : AttrSize.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    colors: (json['colors'] as List)
        ?.map((e) =>
            e == null ? null : AttrColor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'list_banner': instance.listBanner,
      'category_product': instance.category,
      'sizes': instance.sizes,
      'colors': instance.colors,
    };
