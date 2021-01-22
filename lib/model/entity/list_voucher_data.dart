import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_cchat/model/entity/list_voucher.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_voucher_data.g.dart';

@JsonSerializable()
class ListVoucherData extends Equatable {
  List<ListVoucher> list;

  ListVoucherData(this.list);

  factory ListVoucherData.fromJson(Map<String, dynamic> json) =>
      _$ListVoucherDataFromJson(json);

  Map<String, dynamic> toJson() => _$ListVoucherDataToJson(this);

  @override
  List<Object> get props => [list];
}
