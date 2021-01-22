import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart extends Equatable {
  int id;
  @JsonKey(name: "product_id")
  int productId;
  @JsonKey(name: "product_name")
  String productName;
  @JsonKey(name: "product_price")
  int productPrice;
  @JsonKey(name: "product_sale_price")
  int productSalePrice;
  @JsonKey(name: "is_sale")
  int isSale;
  @JsonKey(name: "product_image")
  List<String> productImage;
  @JsonKey(name: "product_quantity")
  int productQuantity;
  @JsonKey(name: "product_distribute")
  String productDistribute;

  Cart(
      this.id,
      this.productId,
      this.productName,
      this.productPrice,
      this.productSalePrice,
      this.isSale,
      this.productImage,
      this.productQuantity,
      this.productDistribute);

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);

  @override
  List<Object> get props => [
        id,
        productId,
        productName,
        productPrice,
        productSalePrice,
        isSale,
        productImage,
        productQuantity,
        productDistribute
      ];

  @override
  String toString() {
    return 'Cart{id: $id, productId: $productId, productName: $productName, productPrice: $productPrice, productSalePrice: $productSalePrice, isSale: $isSale, productImage: $productImage, productQuantity: $productQuantity, productDistribute: $productDistribute}';
  }
}
