// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_data_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDataData _$NewsDataDataFromJson(Map<String, dynamic> json) {
  return NewsDataData(
    json['data'] == null
        ? null
        : NewsData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NewsDataDataToJson(NewsDataData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
