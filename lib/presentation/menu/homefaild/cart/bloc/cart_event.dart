// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';
//
// class CartEvent extends Equatable {
//   const CartEvent();
//
//   List<Object> get props => [];
// }
//
// class LoadCart extends CartEvent {}
//
// class RefreshCart extends CartEvent {}
//
// class AddCart extends CartEvent {
//   final int productId;
//   final int colorId;
//   final int sizeId;
//   final int quantity;
//
//   AddCart(
//       {@required this.productId,
//       @required this.colorId,
//       @required this.sizeId,
//       @required this.quantity});
//
//   List<Object> get props => [productId, colorId, sizeId, quantity];
//
//   @override
//   String toString() {
//     return 'AddCart{productId: $productId, colorId: $colorId, sizeId: $sizeId, quantity: $quantity}';
//   }
// }
//
// class RemoveCart extends CartEvent {
//   final int userCartId;
//
//   RemoveCart(this.userCartId);
//
//   List<Object> get props => [userCartId];
//
//   @override
//   String toString() {
//     return 'RemoveCart{userCartId: $userCartId}';
//   }
// }
//
// class QuantityAddCart extends CartEvent {
//   final int userCartId;
//
//   QuantityAddCart(this.userCartId);
//
//   List<Object> get props => [userCartId];
//
//   @override
//   String toString() {
//     return 'QuantityAddCart{userCartId: $userCartId}';
//   }
// }
//
// class QuantityRemoveCart extends CartEvent {
//   final int userCartId;
//
//   QuantityRemoveCart(this.userCartId);
//
//   List<Object> get props => [userCartId];
//
//   @override
//   String toString() {
//     return 'QuantityRemoveCart{userCartId: $userCartId}';
//   }
// }
