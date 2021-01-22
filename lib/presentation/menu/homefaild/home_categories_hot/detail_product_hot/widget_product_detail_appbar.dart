// import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
// import 'package:flutter_app_cchat/presentation/common_widgets/widget_appbar.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:share/share.dart';
//
//
//
// class WidgetProductDetailAppbar extends StatefulWidget {
//   @override
//   _WidgetProductDetailAppbarState createState() =>
//       _WidgetProductDetailAppbarState();
// }
//
// class _WidgetProductDetailAppbarState extends State<WidgetProductDetailAppbar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: WidgetAppbar(
//         left: [WidgetAppbarMenuBack()],
//         right: [
//           WidgetProductDetailLike(),
//           BlocBuilder<ProductDetailBloc, ProductDetailState>(
//             builder: (context, productDetailState) {
//               if (productDetailState is ProductDetailLoaded) {
//                 if (productDetailState?.productDetailData?.product?.linkShare ==
//                     null) return Container();
//                 return WidgetAppbarMenu(
//                   icon: Image.asset('assets/icons/ic_share.png'),
//                   onTap: () {
//                     openUrl(productDetailState
//                         ?.productDetailData?.product?.linkShare);
//                   },
//                 );
//               } else {
//                 return Container();
//               }
//             },
//           ),
//           WidgetCartAppBarMenu()
//         ],
//       ),
//     );
//   }
//
//   openUrl(String url) async {
//     if (url == null) return;
//     Share.share('Check out on website: $url');
//   }
// }
