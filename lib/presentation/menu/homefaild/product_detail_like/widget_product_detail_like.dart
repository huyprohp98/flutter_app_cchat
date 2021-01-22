// import 'package:flutter_app_cchat/app/auth_bloc/bloc.dart';
// import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
// import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
// import 'package:flutter_app_cchat/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_icons/flutter_icons.dart';
//
// class WidgetProductDetailLike extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProductDetailBloc, ProductDetailState>(
//       builder: (context, productDetailState) {
//         if (productDetailState is ProductDetailLoaded) {
//           return BlocListener<ProductDetailLikeBloc, ProductDetailLikeState>(
//             listener: (context, state) async {
//               if (state.status != null) {
//                 if (state.status.code == DioStatus.API_PROGRESS_NOTIFY) {
//                   await HttpHandler.resolve(status: state.status);
//                 }
//                 if (state.status.code == DioStatus.API_SUCCESS) {
//                   BlocProvider.of<ProductDetailBloc>(context).add(
//                       LoadProductDetail(
//                           productDetailState.productDetailData.product.id));
//                   await HttpHandler.resolve(status: state.status);
//                   GetDialogUtils.createNotify(
//                     message: '${state.status.message}',
//                     positiveLabel: AppLocalizations.of(context)
//                         .translate('product_detail.like_positive'),
//                     negativeLabel: AppLocalizations.of(context)
//                         .translate('product_detail.like_negative'),
//                     onPositiveTap: () {
//                       AppNavigator.navigateBack();
//                       AppNavigator.navigateProductCollection(ProductCollectionType.FAVORITE);
//                     },
//                   );
//                 }
//                 if (state.status.code == DioStatus.API_FAILURE_NOTIFY) {
//                   await HttpHandler.resolve(status: state.status);
//                 }
//               }
//             },
//             child: WidgetAppbarMenu(
//               icon: productDetailState.productDetailData.product.isLike == 0
//                   ? Image.asset('assets/icons/ic_heart_black.png')
//                   : Image.asset('assets/icons/ic_heart_red.png'),
//               onTap: () {
//                 if (BlocProvider.of<AuthenticationBloc>(context).state
//                     is! Authenticated) {
//                   GetDialogUtils.createNotify(
//                       message: AppLocalizations.of(context)
//                           .translate('authentication.message'),
//                       positiveLabel: AppLocalizations.of(context)
//                           .translate('authentication.positive'),
//                       negativeLabel: AppLocalizations.of(context)
//                           .translate('authentication.negative'),
//                       onPositiveTap: () {
//                         AppNavigator.navigateLogin();
//                       });
//                 } else {
//                   BlocProvider.of<ProductDetailLikeBloc>(context).add(
//                       ProductDetailLikeSubmitted(
//                           productDetailState.productDetailData.product.id));
//                 }
//               },
//             ),
//           );
//         } else {
//           return WidgetSpacer();
//         }
//       },
//     );
//   }
// }
