// import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
// import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
// import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
// import 'package:flutter_app_cchat/presentation/menu/homefaild/product_detail_like/bloc/product_detail_like_event.dart';
// import 'package:flutter_app_cchat/presentation/menu/homefaild/product_detail_like/bloc/product_detail_like_state.dart';
// import 'package:flutter_app_cchat/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rxdart/rxdart.dart';
//
// class ProductDetailLikeBloc
//     extends Bloc<ProductDetailLikeEvent, ProductDetailLikeState> {
//   final UserRepository _userRepository;
//
//   ProductDetailLikeBloc({
//     @required UserRepository userRepository,
//   })  : assert(userRepository != null),
//         _userRepository = userRepository;
//
//   @override
//   get initialState => ProductDetailLikeState.empty();
//
//   @override
//   Stream<ProductDetailLikeState> mapEventToState(
//       ProductDetailLikeEvent event) async* {
//     if (event is ProductDetailLikeSubmitted) {
//       yield* _mapProductDetailLikeSubmittedToState(event.productId);
//     }
//   }
//
//   Stream<ProductDetailLikeState> _mapProductDetailLikeSubmittedToState(
//       int productId) async* {
//     try {
//       yield ProductDetailLikeState.loading(state);
//       var response = await _userRepository.productLike(productId: productId);
//
//       if (response.status == Endpoint.SUCCESS) {
//         yield ProductDetailLikeState.success(state.update(
//             status: DioStatus(
//                 message: response.message, code: DioStatus.API_SUCCESS)));
//       } else {
//         yield ProductDetailLikeState.failure(state.update(
//             status: DioStatus(
//                 message: response.message,
//                 code: DioStatus.API_FAILURE_NOTIFY)));
//       }
//     } catch (e) {
//       yield ProductDetailLikeState.failure(
//           state.update(status: DioErrorUtil.handleError(e)));
//     }
//   }
// }
