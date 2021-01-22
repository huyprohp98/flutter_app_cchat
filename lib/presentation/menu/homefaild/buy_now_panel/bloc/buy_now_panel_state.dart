import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/color_catergory_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/sizes.dart';
import 'package:flutter_app_cchat/utils/dio/barrel_dio.dart';
import 'package:flutter/cupertino.dart';

class BuyNowPanelState {
  final CategoryProductHotData product;
  final ColorCatergoryProductHot color;
  final Sizes size;
  final int quantity;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  bool get isFormValid {
    if (product.isAttr == 0) {
      return quantity >= 1;
    } else
      return color != null && size != null && quantity >= 1;
  }

  BuyNowPanelState(
      {this.product,
      @required this.color,
      @required this.size,
      this.quantity = 1,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.status});

  factory BuyNowPanelState.empty() {
    return BuyNowPanelState(
        color: null,
        size: null,
        quantity: 1,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory BuyNowPanelState.loading(BuyNowPanelState state) {
    return BuyNowPanelState(
      product: state.product,
      color: state.color,
      size: state.size,
      quantity: state.quantity,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
      status: null,
    );
  }

  factory BuyNowPanelState.failure(BuyNowPanelState state) {
    return BuyNowPanelState(
        product: state.product,
        color: state.color,
        size: state.size,
        quantity: state.quantity,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        status: state.status);
  }

  factory BuyNowPanelState.success(BuyNowPanelState state) {
    return BuyNowPanelState(
        product: state.product,
        color: state.color,
        size: state.size,
        quantity: state.quantity,
        isSuccess: true,
        isSubmitting: false,
        isFailure: false,
        status: state.status);
  }

  BuyNowPanelState update(
      {CategoryProductHotData product,
        ColorCatergoryProductHot color,
        Sizes size,
      int quantity,
      DioStatus status}) {
    return copyWith(
        product: product,
        color: color,
        size: size,
        quantity: quantity,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: status);
  }

  BuyNowPanelState copyWith({
    CategoryProductHotData product,
    ColorCatergoryProductHot color,
    Sizes size,
    int quantity = 1,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return BuyNowPanelState(
      product: product ?? this.product,
      color: color ?? this.color,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  BuyNowPanelState copyWithState(BuyNowPanelState state) {
    return BuyNowPanelState(
      color: state.color ?? this.color,
      size: state.size ?? this.size,
      quantity: state.color ?? this.quantity,
      isSubmitting: state.quantity ?? this.isSubmitting,
      isSuccess: state.isSuccess ?? this.isSuccess,
      isFailure: state.isFailure ?? this.isFailure,
      status: state.status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'BuyNowPanelState{product: $product, color: $color, size: $size, quantity: $quantity, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
