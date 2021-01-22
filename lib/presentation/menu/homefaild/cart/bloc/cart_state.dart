// import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
// import 'package:flutter_app_cchat/utils/dio/barrel_dio.dart';
// import 'package:meta/meta.dart';
//
// class CartState {
//   final List<Cart> carts;
//   final bool isLoading;
//   final bool isSuccess;
//   final bool isFailure;
//   final DioStatus status;
//
//   CartState(
//       {@required this.carts,
//       @required this.isLoading,
//       @required this.isSuccess,
//       @required this.isFailure,
//       @required this.status});
//
//   factory CartState.empty() {
//     return CartState(
//         carts: null,
//         isLoading: false,
//         isSuccess: false,
//         isFailure: false,
//         status: null);
//   }
//
//   factory CartState.loading(CartState state) {
//     return CartState(
//         carts: state.carts,
//         isLoading: true,
//         isSuccess: false,
//         isFailure: false,
//         status: state.status);
//   }
//
//   factory CartState.failure(CartState state) {
//     return CartState(
//         carts: state.carts,
//         isLoading: false,
//         isSuccess: false,
//         isFailure: true,
//         status: state.status);
//   }
//
//   factory CartState.success(CartState state) {
//     return CartState(
//         carts: state.carts,
//         isLoading: false,
//         isSuccess: true,
//         isFailure: false,
//         status: state.status);
//   }
//
//   CartState update(
//       {List<Cart> carts,
//       bool isLoading,
//       bool isSuccess,
//       bool isFailure,
//       DioStatus status}) {
//     return copyWith(
//       carts: carts,
//       isLoading: false,
//       isSuccess: false,
//       isFailure: false,
//       status: status,
//     );
//   }
//
//   CartState copyWith({
//     List<Cart> carts,
//     bool isLoading,
//     bool isSuccess,
//     bool isFailure,
//     DioStatus status,
//   }) {
//     return CartState(
//       carts: carts ?? this.carts,
//       isLoading: isLoading ?? this.isLoading,
//       isSuccess: isSuccess ?? this.isSuccess,
//       isFailure: isFailure ?? this.isFailure,
//       status: status ?? this.status,
//     );
//   }
//
//   int getTotalInvoice() {
//     if (carts != null) {
//       int totalPrice = 0;
//       for (int i = 0; i < carts.length; i++) {
//         var cart = carts[i];
//         var productPrice = 0;
//         if (cart.isSale == 0) {
//           productPrice = cart.productPrice * cart.productQuantity;
//         } else {
//           productPrice = cart.productSalePrice * cart.productQuantity;
//         }
//         totalPrice += productPrice;
//       }
//       return totalPrice;
//     } else {
//       return 0;
//     }
//   }
//
//   bool checkPromotion(Promotion promotion) {
//     var isAddPromotion = true;
//     if (getTotalInvoice() < promotion.invoiceTotal) {
//       isAddPromotion = false;
//     }
//     print(isAddPromotion);
//     var dateStart = promotion.startDate.split('-');
//     var dateTimeStart = DateTime(int.parse(dateStart[0]),
//         int.parse(dateStart[1]), int.parse(dateStart[2]));
//     var dateEnd = promotion.endDate.split('-');
//     var dateTimeEnd = DateTime(int.parse(dateEnd[0]),
//         int.parse(dateEnd[1]), int.parse(dateEnd[2]));
//     if (!DateTime.now().isAfter(dateTimeStart)  && !DateTime.now().isBefore(dateTimeEnd)) {
//       isAddPromotion = false;
//     }
//     return isAddPromotion;
//   }
//
//   @override
//   String toString() {
//     return 'CartState{carts: $carts, isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
//   }
// }
