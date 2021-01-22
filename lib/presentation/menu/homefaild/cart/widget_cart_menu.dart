// import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
// import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
// import 'package:flutter_app_cchat/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'bloc/cart_bloc.dart';
// import 'bloc/cart_state.dart';
//
// class WidgetCartMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
//       return _buildContent(context, state);
//     });
//   }
//
//   Widget _buildContent(BuildContext context, CartState state) {
//     if (state.carts != null) {
//
//       return state.carts.length > 0 ? Container(
//         height: AppValue.ACTION_BAR_HEIGHT,
//         child: Column(
//           children: [
//             Divider(
//               height: 1,
//               thickness: 0.5,
//               color: AppColor.GREY,
//             ),
//             Expanded(
//                 child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     height: double.infinity,
//                     alignment: Alignment.center,
//                     child: RichText(
//                       text: TextSpan(
//                           text: AppLocalizations.of(context)
//                               .translate('cart.menu_total').toUpperCase(),
//                           style: AppStyle.DEFAULT_SMALL,
//                           children: [
//                             TextSpan(
//                               text:
//                                   AppValue.APP_MONEY_FORMAT.format(state.getTotalInvoice()),
//                               style: AppStyle.DEFAULT_SMALL
//                                   .copyWith(color: AppColor.RED),
//                             )
//                           ]),
//                     ),
//                     color: AppColor.WHITE,
//                   ),
//                 ),
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       AppNavigator.navigatePayment();
//                     },
//                     child: Container(
//                       height: double.infinity,
//                       alignment: Alignment.center,
//                       child: Text(
//                         AppLocalizations.of(context)
//                             .translate('cart.menu_order_now').toUpperCase(),
//                         style: AppStyle.DEFAULT_MEDIUM
//                             .copyWith(color: AppColor.WHITE),
//                         textAlign: TextAlign.center,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       color: AppColor.THIRD_COLOR,
//                     ),
//                   ),
//                 )
//               ],
//             )),
//           ],
//         ),
//       ) : WidgetSpacer();
//     } else {
//       return Center(child: WidgetCircleProgress());
//     }
//   }
// }
