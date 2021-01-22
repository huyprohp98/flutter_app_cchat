// import 'package:flutter_app_cchat/utils/dio/barrel_dio.dart';
// import 'package:flutter/material.dart';
//
// class ProductDetailLikeState {
//   final int productId;
//   final DioStatus status;
//
//   bool get isFormValid => productId != null;
//
//   ProductDetailLikeState({
//     @required this.productId,
//     @required this.status,
//   });
//
//   factory ProductDetailLikeState.empty() {
//     return ProductDetailLikeState(productId: null, status: null);
//   }
//
//   factory ProductDetailLikeState.loading(ProductDetailLikeState state) {
//     return ProductDetailLikeState(
//         productId: state.productId, status: DioStatus.loadingNotify());
//   }
//
//   factory ProductDetailLikeState.failure(ProductDetailLikeState state) {
//     return ProductDetailLikeState(
//         productId: state.productId, status: state.status);
//   }
//
//   factory ProductDetailLikeState.success(ProductDetailLikeState state) {
//     return ProductDetailLikeState(
//         productId: state.productId, status: state.status);
//   }
//
//   ProductDetailLikeState update({int productId, DioStatus status}) {
//     return copyWith(
//       productId: productId,
//       status: status,
//     );
//   }
//
//   ProductDetailLikeState copyWith({int productId, DioStatus status}) {
//     return ProductDetailLikeState(
//       productId: productId ?? this.productId,
//       status: status ?? this.status,
//     );
//   }
//
//   @override
//   String toString() {
//     return 'ProductDetailLikeState{productId: $productId, status: $status}';
//   }
// }
