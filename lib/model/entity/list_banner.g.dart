// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListBanner _$ListBannerFromJson(Map<String, dynamic> json) {
  return ListBanner(
    (json['list_banner'] as List)
        ?.map((e) =>
            e == null ? null : Banners.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListBannerToJson(ListBanner instance) =>
    <String, dynamic>{
      'list_banner': instance.listBanner,
    };
