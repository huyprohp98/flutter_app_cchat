// import 'package:flutter_app_cchat/model/repo/payment_repository.dart';
// import 'package:flutter_app_cchat/utils/utils.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
//
// import 'cart_promotion_event.dart';
// import 'cart_promotion_state.dart';
//
// class CartPromotionBloc extends Bloc<CartPromotionEvent, CartPromotionState> {
//   final PaymentRepository paymentRepository;
//
//   CartPromotionBloc({@required this.paymentRepository});
//
//   @override
//   CartPromotionState get initialState => CartPromotionState.empty();
//
//   @override
//   Stream<CartPromotionState> mapEventToState(CartPromotionEvent event) async* {
//     if (event is LoadCartPromotion) {
//       yield* _mapLoadCartPromotionToState();
//     } else if (event is RefreshCartPromotion) {
//       yield CartPromotionState.loading(state);
//       yield* _mapLoadCartPromotionToState();
//     }
//   }
//
//   Stream<CartPromotionState> _mapLoadCartPromotionToState() async* {
//     try {
//       final response = await paymentRepository.getPaymentPromotion();
//       yield CartPromotionState.success(state.update(
//           promotions: response.data.rows,
//           status: DioStatus(
//               code: DioStatus.API_SUCCESS, message: response.message)));
//     } catch (e) {
//       yield CartPromotionState.failure(
//           state.update(status: DioErrorUtil.handleError(e)));
//     }
//   }
// }
