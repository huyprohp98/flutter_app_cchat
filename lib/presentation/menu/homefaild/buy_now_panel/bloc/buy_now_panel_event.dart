import 'package:flutter_app_cchat/model/entity/attr_color.dart';
import 'package:flutter_app_cchat/model/entity/attr_size.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/color_catergory_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/sizes.dart';

abstract class BuyNowPanelEvent extends Equatable {
  const BuyNowPanelEvent();

  @override
  List<Object> get props => [];
}

class AddProduct extends BuyNowPanelEvent {
  final CategoryProductHotData product;

  const AddProduct({@required this.product});

  @override
  List<Object> get props => [product];

}

class SelectColor extends BuyNowPanelEvent {
  final ColorCatergoryProductHot color;

  const SelectColor({@required this.color});

  @override
  List<Object> get props => [color];

  @override
  String toString() {
    return 'SelectColor{color: $color}';
  }
}

class SelectSize extends BuyNowPanelEvent {
  final Sizes size;

  SelectSize({@required this.size});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'SelectSize{size: $size}';
  }
}

class IncreaseQuantity extends BuyNowPanelEvent {
  IncreaseQuantity();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'IncreaseQuantity{}';
  }
}

class DecreaseQuantity extends BuyNowPanelEvent {
  DecreaseQuantity();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'DecreaseQuantity{}';
  }
}

class ProductDetailAddCart extends BuyNowPanelEvent {

  const ProductDetailAddCart();

//  @override
//  List<Object> get props => [productId, color, size, quantity];
//
//  @override
//  String toString() {
//    return 'ProductDetailAddCart{productId: $productId, color: $color, size: $size, quantity: $quantity}';
//  }
}

class ProductDetailBuyNow extends BuyNowPanelEvent {
  final int productId ;
  final ColorCatergoryProductHot color;
  final Sizes size;
  final int quantity;

  const ProductDetailBuyNow({
    @required this.productId,
    @required this.color,
    @required this.size,
    @required this.quantity
  });

  @override
  List<Object> get props => [productId, color, size, quantity];

  @override
  String toString() {
    return 'ProductDetailBuyNow{productId: $productId, color: $color, size: $size, quantity: $quantity}';
  }
}

