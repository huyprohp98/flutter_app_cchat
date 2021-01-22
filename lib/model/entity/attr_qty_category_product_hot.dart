import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'attr_qty_category_product_hot.g.dart';

@JsonSerializable()
class AttrQty extends Equatable {
  @JsonKey(name: "size_id")
  int sizeId;
  @JsonKey(name: "size_name")
  String sizeName;
  @JsonKey(name: "color_id")
  int colorId;
  @JsonKey(name: "color_name")
  String colorName;
  @JsonKey(name: "quantity")
  int quantity;


  AttrQty(
      this.sizeId,
      this.sizeName,
      this.colorId,
      this.colorName,
      this.quantity,
      );

  factory AttrQty.fromJson(Map<String, dynamic> json) => _$AttrQtyFromJson(json);

  Map<String, dynamic> toJson() => _$AttrQtyToJson(this);

  @override
  List<Object> get props => [
    sizeId,
    sizeName,
    colorId,
    colorName,
    quantity,
      ];

  @override
  String toString() {
    return 'AttrQty{sizeId: $sizeId, sizeName: $sizeName, colorId: $colorId, colorName: $colorName, quantity: $quantity}';
  }
}
