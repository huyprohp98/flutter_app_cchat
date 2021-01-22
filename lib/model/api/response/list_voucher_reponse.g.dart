// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_voucher_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListVoucherResponse _$ListVoucherResponseFromJson(Map<String, dynamic> json) {
  return ListVoucherResponse(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Vouchers.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..status = json['status'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$ListVoucherResponseToJson(
        ListVoucherResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
