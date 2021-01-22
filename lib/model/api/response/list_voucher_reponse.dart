import 'package:flutter_app_cchat/model/api/response/base_response.dart';
import 'package:flutter_app_cchat/model/entity/list_voucher_data.dart';
import 'package:flutter_app_cchat/model/entity/news_data_data.dart';
import 'package:flutter_app_cchat/model/entity/vouchers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_voucher_reponse.g.dart';

@JsonSerializable()
class ListVoucherResponse extends BaseResponse {
  List<Vouchers> data;

  ListVoucherResponse(this.data);

  factory ListVoucherResponse.fromJson(Map<String, dynamic> json) =>
      _$ListVoucherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListVoucherResponseToJson(this);
}
