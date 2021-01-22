// import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
// import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
// import 'package:flutter_app_cchat/presentation/common_widgets/widget_product_cart.dart';
// import 'package:flutter_app_cchat/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
//
// import 'bloc/cart_bloc.dart';
// import 'bloc/cart_event.dart';
// import 'bloc/cart_state.dart';
//
// class WidgetCartProduct extends StatefulWidget {
//   @override
//   _WidgetCartProductState createState() => _WidgetCartProductState();
// }
//
// class _WidgetCartProductState extends State<WidgetCartProduct> {
//   RefreshController _refreshController =
//       RefreshController(initialRefresh: false);
//
//   _onRefresh() async {}
//
//   _onLoadMore() async {}
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<CartBloc, CartState>(
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
//       child: BlocBuilder<CartBloc, CartState>(
//         builder: (context, state) {
//           return _buildContent(state);
//         },
//       ),
//     );
//   }
//
//   Widget _buildContent(CartState state) {
//     if (state.carts != null) {
//       return SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               ListView.separated(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   return WidgetProductCart(
//                     cart: state.carts[index],
//                     onDeleteTap: () {
//                       GetDialogUtils.createNotify(
//                           message: AppLocalizations.of(context)
//                               .translate('cart.delete_message'),
//                           positiveLabel: AppLocalizations.of(context)
//                               .translate('cart.delete_message_positive'),
//                           negativeLabel: AppLocalizations.of(context)
//                               .translate('cart.delete_message_negative'),
//                           onPositiveTap: () {
//                             BlocProvider.of<CartBloc>(context)
//                                 .add(RemoveCart(state.carts[index].id));
//                             AppNavigator.navigateBack();
//                           });
//                     },
//                     onQuantityAdd: () {
//                       BlocProvider.of<CartBloc>(context)
//                           .add(QuantityAddCart(state.carts[index].id));
//                     },
//                     onQuantityRemove: () {
//                       BlocProvider.of<CartBloc>(context)
//                           .add(QuantityRemoveCart(state.carts[index].id));
//                     },
//                   );
//                 },
//                 itemCount: state.carts.length,
//                 separatorBuilder: (context, index) {
//                   return WidgetSpacer(height: 20);
//                 },
//                 physics: ScrollPhysics(),
//               ),
//               WidgetSpacer(
//                 height: MediaQuery.of(context).size.height*2/3,
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
