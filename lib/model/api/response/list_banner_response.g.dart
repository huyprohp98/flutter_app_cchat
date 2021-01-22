// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListBannerResponse _$ListBannerResponseFromJson(Map<String, dynamic> json) {
  return ListBannerResponse(
    json['data'] == null
        ? null
        : ListBanner.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$ListBannerResponseToJson(ListBannerResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
