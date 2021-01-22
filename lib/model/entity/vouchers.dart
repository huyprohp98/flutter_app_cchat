import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vouchers.g.dart';

@JsonSerializable()
class Vouchers extends Equatable {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "detail_voucher")
  String detailVoucher;
  @JsonKey(name: "point")
  int point;
  @JsonKey(name: "type")
  int type;
  @JsonKey(name: "percent_off")
  double percentOff;
  @JsonKey(name: "sale_price")
  double salePrice;
  @JsonKey(name: "max_sale_price")
  double maxSalePrice;
  @JsonKey(name: "invoice_total")
  double invoiceTotal;
  @JsonKey(name: "expires_at")
  String expiresAt;

  Vouchers(
    this.id,
    this.name,
    this.image,
    this.detailVoucher,
    this.point,
    this.type,
    this.percentOff,
    this.salePrice,
    this.maxSalePrice,
    this.invoiceTotal,
    this.expiresAt,
  );

  factory Vouchers.fromJson(Map<String, dynamic> json) =>
      _$VouchersFromJson(json);

  Map<String, dynamic> toJson() => _$VouchersToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        image,
        detailVoucher,
        point,
        type,
        percentOff,
        salePrice,
        maxSalePrice,
        invoiceTotal,
        expiresAt,
      ];

  @override
  String toString() {
    return 'Vouchers{id: $id, name:$name,image:$image,detailVoucher:$detailVoucher,point:$point,type:$type,percentOff:$percentOff,salePrice:$salePrice,maxSalePrice:$maxSalePrice,invoiceTotal:$invoiceTotal,expiresAt:$expiresAt}';
  }
}
