// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeListData _$HomeListDataFromJson(Map<String, dynamic> json) {
  return HomeListData(
    listBanner: (json['list_banner'] as List)
        ?.map((e) =>
            e == null ? null : ListBanner.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    category: (json['category_product'] as List)
        ?.map((e) => e == null
            ? null
            : ListCategoryProduct.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sizes: (json['sizes'] as List)
        ?.map((e) =>
            e == null ? null : HomeSizes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    colors: (json['colors'] as List)
        ?.map((e) =>
            e == null ? null : HomeColors.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    numberProductInCart: json['number_product_in_cart'] as int,
  );
}

Map<String, dynamic> _$HomeListDataToJson(HomeListData instance) =>
    <String, dynamic>{
      'list_banner': instance.listBanner,
      'category_product': instance.category,
      'sizes': instance.sizes,
      'colors': instance.colors,
      'number_product_in_cart': instance.numberProductInCart,
    };
