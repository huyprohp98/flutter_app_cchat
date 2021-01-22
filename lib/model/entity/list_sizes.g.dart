// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_sizes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListSize _$ListSizeFromJson(Map<String, dynamic> json) {
  return ListSize(
    (json['sizes'] as List)
        ?.map(
            (e) => e == null ? null : Sizes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListSizeToJson(ListSize instance) => <String, dynamic>{
      'sizes': instance.sizes,
    };
