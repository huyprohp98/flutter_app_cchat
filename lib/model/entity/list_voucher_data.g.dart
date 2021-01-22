// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_voucher_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListVoucherData _$ListVoucherDataFromJson(Map<String, dynamic> json) {
  return ListVoucherData(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : ListVoucher.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListVoucherDataToJson(ListVoucherData instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
