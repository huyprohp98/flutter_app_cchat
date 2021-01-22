// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsProductResponse _$NewsProductResponseFromJson(Map<String, dynamic> json) {
  return NewsProductResponse(
    json['data'] == null
        ? null
        : NewsList.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$NewsProductResponseToJson(
        NewsProductResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
