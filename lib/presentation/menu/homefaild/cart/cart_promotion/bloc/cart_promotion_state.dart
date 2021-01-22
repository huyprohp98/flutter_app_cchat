// import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
// import 'package:flutter_app_cchat/utils/dio/barrel_dio.dart';
// import 'package:meta/meta.dart';
//
// class CartPromotionState {
//   final List<Promotion> promotions;
//   final bool isLoading;
//   final bool isSuccess;
//   final bool isFailure;
//   final DioStatus status;
//
//   CartPromotionState(
//       {@required this.promotions,
//         @required this.isLoading,
//         @required this.isSuccess,
//         @required this.isFailure,
//         @required this.status});
//
//   factory CartPromotionState.empty() {
//     return CartPromotionState(
//         promotions: null,
//         isLoading: false,
//         isSuccess: false,
//         isFailure: false,
//         status: null);
//   }
//
//   factory CartPromotionState.loading(CartPromotionState state) {
//     return CartPromotionState(
//         promotions: null,
//         isLoading: true,
//         isSuccess: false,
//         isFailure: false,
//         status: null);
//   }
//
//   factory CartPromotionState.failure(CartPromotionState state) {
//     return CartPromotionState(
//         promotions: state.promotions,
//         isLoading: false,
//         isSuccess: false,
//         isFailure: true,
//         status: state.status);
//   }
//
//   factory CartPromotionState.success(CartPromotionState state) {
//     return CartPromotionState(
//         promotions: state.promotions,
//         isLoading: false,
//         isSuccess: true,
//         isFailure: false,
//         status: state.status);
//   }
//
//   CartPromotionState update(
//       {List<Promotion> promotions,
//         bool isLoading,
//         bool isSuccess,
//         bool isFailure,
//         DioStatus status}) {
//     return copyWith(
//       promotions: promotions,
//       isLoading: false,
//       isSuccess: false,
//       isFailure: false,
//       status: status,
//     );
//   }
//
//   CartPromotionState copyWith({
//     List<Promotion> promotions,
//     bool isLoading,
//     bool isSuccess,
//     bool isFailure,
//     DioStatus status,
//   }) {
//     return CartPromotionState(
//       promotions: promotions ?? this.promotions,
//       isLoading: isLoading ?? this.isLoading,
//       isSuccess: isSuccess ?? this.isSuccess,
//       isFailure: isFailure ?? this.isFailure,
//       status: status ?? this.status,
//     );
//   }
//
//   @override
//   String toString() {
//     return 'CartPromotionState{promotions: $promotions, isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
//   }
// }
