// import 'package:cchat/app/constants/barrel_constants.dart';
// import 'package:cchat/presentation/common_widgets/barrel_common_widgets.dart';
// import 'package:cchat/presentation/screen/barrel_screen.dart';
// import 'package:cchat/presentation/screen/cart/bloc/bloc.dart';
// import 'package:cchat/presentation/screen/cart/cart_promotion/bloc/bloc.dart';
// import 'package:cchat/utils/locale/app_localization.dart';
// import 'package:cchat/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class WidgetCartCode extends StatefulWidget {
//   final Function onChevronRightTap;
//
//   const WidgetCartCode({Key key, this.onChevronRightTap}) : super(key: key);
//
//   @override
//   _WidgetCartCodeState createState() => _WidgetCartCodeState();
// }
//
// class _WidgetCartCodeState extends State<WidgetCartCode> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<CartPromotionBloc>(context).add(LoadCartPromotion());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Container(
//             height: AppValue.CART_PROMOTION_MENU_HEIGHT,
//             padding: EdgeInsets.symmetric(horizontal: 5),
//             child: Row(
//               children: [
//                 AspectRatio(
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
//                     child: Container(
//                       child: Image.asset('assets/images/img_coupon.png'),
//                     ),
//                   ),
//                   aspectRatio: 1,
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Text(
//                       AppLocalizations.of(context).translate('cart.sale'),
//                       style: AppStyle.DEFAULT_MEDIUM,
//                     ),
//                   ),
//                 ),
//                 AspectRatio(
//                   child: GestureDetector(
//                     onTap: widget.onChevronRightTap,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 0, horizontal: 5),
//                       child: Container(
//                         child: Icon(
//                           Icons.chevron_right,
//                           color: AppColor.GREY,
//                         ),
//                       ),
//                     ),
//                   ),
//                   aspectRatio: 1,
//                 ),
//               ],
//             ),
//           ),
//           Divider(
//             height: 1,
//             color: AppColor.GREY,
//           ),
//           Expanded(
//             child: _buildPromotions(),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildPromotions() {
//     return BlocListener<CartPromotionBloc, CartPromotionState>(
//       listener: (context, state) async {
//         if (state.isLoading) {
//           await HttpHandler.resolve(status: state.status);
//         }
//
//         if (state.isSuccess) {
//           await HttpHandler.resolve(status: state.status);
//         }
//
//         if (state.isFailure) {
//           await HttpHandler.resolve(status: state.status);
//         }
//       },
//       child: BlocBuilder<CartPromotionBloc, CartPromotionState>(
//         builder: (context, state) {
//           return RefreshIndicator(
//               onRefresh: () async {
//                 BlocProvider.of<CartPromotionBloc>(context)
//                     .add(RefreshCartPromotion());
//                 await Future.delayed(AppValue.FAKE_TIME_RELOAD);
//                 return true;
//               },
//               color: AppColor.PRIMARY_COLOR,
//               backgroundColor: AppColor.THIRD_COLOR,
//               child: _buildPromotionsContent(state));
//         },
//       ),
//     );
//   }
//
//   Widget _buildPromotionsContent(CartPromotionState state) {
//     if (state.promotions != null) {
//       return SingleChildScrollView(
//         physics: ScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               ListView.separated(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   return WidgetPromotionItem(
//                     promotion: state.promotions[index],
//                     onTap: () {
//                       print('---checkPromotion---');
//                       var checkPromotion = BlocProvider.of<CartBloc>(context)
//                           .state
//                           .checkPromotion(state.promotions[index]);
//
//                       if (checkPromotion) {
//                         AppNavigator.navigatePayment(
//                           promotion: state.promotions[index],
//                         );
//                       } else {
//                         GetDialogUtils.createNotify(
//                             message:
//                                 '${AppLocalizations.of(context).translate('cart.promotion_failure_message')} ${AppValue.APP_MONEY_FORMAT.format(state.promotions[index].invoiceTotal)}',
//                             positiveLabel: AppLocalizations.of(context)
//                                 .translate('cart.promotion_failure_positive'),
//                             negativeLabel: AppLocalizations.of(context)
//                                 .translate('cart.promotion_failure_negative'),
//                             onPositiveTap: () {
// //                              BlocProvider.of<CartBloc>(context)
// //                                  .add(RemoveCart(state.carts[index].id));
//                               AppNavigator.navigateBack();
//                             });
//                       }
//                     },
//                   );
//                 },
//                 itemCount: state.promotions.length,
//                 separatorBuilder: (context, index) {
//                   return WidgetSpacer(height: 20);
//                 },
//                 physics: ScrollPhysics(),
//               ),
//               WidgetSpacer(
//                 height: MediaQuery.of(context).size.height/4,
//               )
//             ],
//           ),
//         ),
//       );
//     } else {
//       return Center(child: WidgetCircleProgress());
//     }
//   }
// }
