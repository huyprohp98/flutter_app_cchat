// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsProduct _$NewsProductFromJson(Map<String, dynamic> json) {
  return NewsProduct(
    json['id'] as int,
    json['title'] as String,
    json['description'] as String,
    json['content'] as String,
    json['type'] as int,
    json['video_link'] as String,
    json['image'] as String,
    json['percent_off'] as int,
    json['is_use_with_voucher'] as int,
    json['invoice_total'] as int,
    json['max_sale'] as int,
    json['start_date'] as String,
    json['end_date'] as String,
    json['created_at'] as String,
  );
}

Map<String, dynamic> _$NewsProductToJson(NewsProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'type': instance.type,
      'video_link': instance.videoLink,
      'image': instance.image,
      'percent_off': instance.percentOff,
      'is_use_with_voucher': instance.isUseWithVoucher,
      'invoice_total': instance.invoiceTotal,
      'max_sale': instance.maxSale,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'created_at': instance.createdAt,
    };
