// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeColors _$HomeColorsFromJson(Map<String, dynamic> json) {
  return HomeColors(
    json['id'] as int,
    json['name'] as String,
    json['color_code'] as String,
  );
}

Map<String, dynamic> _$HomeColorsToJson(HomeColors instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color_code': instance.colorCode,
    };
