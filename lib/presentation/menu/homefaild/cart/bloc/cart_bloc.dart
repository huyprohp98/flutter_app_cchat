// import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
// import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
// import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
// import 'package:flutter_app_cchat/utils/utils.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
//
// import 'cart_event.dart';
// import 'cart_state.dart';
//
// class CartBloc extends Bloc<CartEvent, CartState> {
//   final CartRepository cartRepository;
//
//   CartBloc({@required this.cartRepository});
//
//   @override
//   CartState get initialState => CartState.empty();
//
//   @override
//   Stream<CartState> mapEventToState(CartEvent event) async* {
//     if (event is LoadCart) {
//       yield* _mapLoadCartToState();
//     } else if (event is RefreshCart) {
//       yield CartState.loading(state.copyWith(status: DioStatus(
//           code: DioStatus.API_PROGRESS,)));
//       yield* _mapLoadCartToState();
//     } else if (event is AddCart) {
//       yield CartState.loading(state.copyWith(status: DioStatus(
//         code: DioStatus.API_PROGRESS,)));
//       yield* _mapAddCartToState(
//           event.productId, event.colorId, event.sizeId, event.quantity);
//     } else if (event is RemoveCart) {
//       yield CartState.loading(state.copyWith(status: DioStatus(
//         code: DioStatus.API_PROGRESS,)));
//       yield* _mapRemoveCartToState(event.userCartId);
//     } else if (event is QuantityAddCart) {
//       yield CartState.loading(state.copyWith(status: DioStatus(
//         code: DioStatus.API_PROGRESS,)));
//       yield* _mapQuantityAddCartToState(event.userCartId);
//     } else if (event is QuantityRemoveCart) {
//       yield CartState.loading(state.copyWith(status: DioStatus(
//         code: DioStatus.API_PROGRESS,)));
//       yield* _mapQuantityRemoveCartToState(event.userCartId);
//     }
//   }
//
//   Stream<CartState> _mapLoadCartToState() async* {
//     try {
//       final response = await cartRepository.getCart();
//       yield CartState.success(state.update(
//           carts: response.data,
//           status: DioStatus(
//               code: DioStatus.API_SUCCESS,
//               message: response.message)));
//     } catch (e) {
//       yield CartState.failure(
//           state.update(status: DioErrorUtil.handleError(e)));
//     }
//   }
//
//   Stream<CartState> _mapAddCartToState(
//       int productId, int colorId, int sizeId, int quantity) async* {
//     try {
//       final response = await cartRepository.cartAdd(
//           productId: productId,
//           colorId: colorId,
//           sizeId: sizeId,
//           quantity: quantity);
//       if (response.status == Endpoint.SUCCESS) {
//         yield CartState.success(state.update(
//             carts: response.data,
//             status: DioStatus(
//                 code: DioStatus.API_SUCCESS_NOTIFY,
//                 message: response.message)));
//       } else {
//         yield CartState.failure(state.update(
//             status: DioStatus(
//                 code: DioStatus.API_FAILURE_NOTIFY,
//                 message: response.message)));
//       }
//     } catch (e) {
//       yield CartState.failure(
//           state.update(status: DioErrorUtil.handleError(e)));
//     }
//   }
//
//   Stream<CartState> _mapRemoveCartToState(int userCartId) async* {
//     try {
//       final response = await cartRepository.cartRemove(userCartId: userCartId);
//       yield CartState.success(state.update(
//           carts: response.data,
//           status: DioStatus(
//               code: DioStatus.API_SUCCESS_NOTIFY,
//               message: response.message)));
//     } catch (e) {
//       yield CartState.failure(
//           state.update(status: DioErrorUtil.handleError(e)));
//     }
//   }
//
//   Stream<CartState> _mapQuantityAddCartToState(int userCartId) async* {
//     try {
//       final response =
//           await cartRepository.cartQuantityAdd(userCartId: userCartId);
//       if (response.status == Endpoint.SUCCESS) {
//         yield CartState.success(state.update(
//             carts: response.data,
//             status: DioStatus(
//                 code: DioStatus.API_SUCCESS_NOTIFY,
//                 message: response.message)));
//       } else {
//         yield CartState.failure(state.update(
//             status: DioStatus(
//                 code: DioStatus.API_FAILURE_NOTIFY,
//                 message: response.message)));
//       }
//     } catch (e) {
//       yield CartState.failure(
//           state.update(status: DioErrorUtil.handleError(e)));
//     }
//   }
//
//   Stream<CartState> _mapQuantityRemoveCartToState(int userCartId) async* {
//     try {
//       final response =
//           await cartRepository.cartQuantityRemove(userCartId: userCartId);
//       if (response.status == Endpoint.SUCCESS) {
//         yield CartState.success(state.update(
//             carts: response.data,
//             status: DioStatus(
//                 code: DioStatus.API_SUCCESS_NOTIFY,
//                 message: response.message)));
//       } else {
//         yield CartState.failure(state.update(
//             status: DioStatus(
//                 code: DioStatus.API_FAILURE_NOTIFY,
//                 message: response.message)));
//       }
//     } catch (e) {
//       yield CartState.failure(
//           state.update(status: DioErrorUtil.handleError(e)));
//     }
//   }
// }
