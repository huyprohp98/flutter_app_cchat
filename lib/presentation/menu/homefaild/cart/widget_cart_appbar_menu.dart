// import 'package:flutter_app_cchat/app/auth_bloc/bloc.dart';
// import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
// import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
// import 'package:flutter_app_cchat/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'bloc/cart_bloc.dart';
// import 'bloc/cart_state.dart';
//
// class WidgetCartAppBarMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartBloc, CartState>(
//       builder: (context, state) {
//         return WidgetAppbarMenu(
//           icon: Image.asset('assets/icons/ic_cart.png'),
//           onTap: () {
//             if (BlocProvider.of<AuthenticationBloc>(context).state
//                 is! Authenticated) {
//               GetDialogUtils.createNotify(
//                   message: AppLocalizations.of(context)
//                       .translate('authentication.message'),
//                   positiveLabel: AppLocalizations.of(context)
//                       .translate('authentication.positive'),
//                   negativeLabel: AppLocalizations.of(context)
//                       .translate('authentication.negative'),
//                   onPositiveTap: () {
//                     AppNavigator.navigateLogin();
//                   });
//             } else {
//               AppNavigator.navigateCart();
//             }
//           },
//           badge: state.carts!=null ? state.carts.length : 0,
//         );
//       },
//     );
//   }
// }
