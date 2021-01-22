// import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app_cchat/presentation/menu/homefaild/cart/widget_cart_appbar.dart';
// import 'package:flutter_app_cchat/presentation/menu/homefaild/cart/widget_cart_menu.dart';
// import 'package:flutter_app_cchat/presentation/menu/homefaild/cart/widget_cart_product.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';
//
// import 'bloc/cart_bloc.dart';
// import 'bloc/cart_event.dart';
// import 'cart_promotion/widget_cart_promotion.dart';
//
// class CartScreen extends StatefulWidget {
//   @override
//   _CartScreenState createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   PanelController _panelController = new PanelController();
//
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<CartBloc>(context).add(LoadCart());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           child: _buildContent(),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildContent() {
//     return Container(
//         child: Column(children: [
//       _buildAppbar(),
//       Expanded(
//         child: SlidingUpPanel(
//             controller: _panelController,
//             minHeight: AppValue.CART_PROMOTION_MENU_HEIGHT,
//             maxHeight: MediaQuery.of(context).size.height / 2,
//             panel: _buildSaleCode(),
//             body: RefreshIndicator(
//                 onRefresh: () async {
//                   BlocProvider.of<CartBloc>(context).add(RefreshCart());
//                   await Future.delayed(Duration(seconds: 2));
//                   return true;
//                 },
//                 color: AppColor.PRIMARY_COLOR,
//                 backgroundColor: AppColor.THIRD_COLOR,
//                 child: _buildCart())),
//       ),
//       WidgetCartMenu(
//
//       )
//     ]));
//   }
//
//   Widget _buildAppbar() => WidgetCartAppbar();
//
//   Widget _buildCart() => WidgetCartProduct();
//
//   Widget _buildSaleCode() => WidgetCartCode(
//         onChevronRightTap: () {
//           _panelController.isPanelOpen
//               ? _panelController.close()
//               : _panelController.open();
//         },
//       );
// }
