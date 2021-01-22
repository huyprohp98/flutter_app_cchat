// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_voucher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListVoucher _$ListVoucherFromJson(Map<String, dynamic> json) {
  return ListVoucher(
    json['id'] as int,
    json['name'] as String,
    json['image'] as String,
    json['detail_voucher'] as String,
    json['point'] as int,
    json['type'] as int,
    (json['percent_off'] as num)?.toDouble(),
    (json['sale_price'] as num)?.toDouble(),
    (json['max_sale_price'] as num)?.toDouble(),
    (json['invoice_total'] as num)?.toDouble(),
    json['expires_at'] as String,
  );
}

Map<String, dynamic> _$ListVoucherToJson(ListVoucher instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'detail_voucher': instance.detailVoucher,
      'point': instance.point,
      'type': instance.type,
      'percent_off': instance.percentOff,
      'sale_price': instance.salePrice,
      'max_sale_price': instance.maxSalePrice,
      'invoice_total': instance.invoiceTotal,
      'expires_at': instance.expiresAt,
    };
