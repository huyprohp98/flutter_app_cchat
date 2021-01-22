// import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
// import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_app_cchat/presentation/common_widgets/widget_appbar_main.dart';
//
// class HomesScreen extends StatefulWidget {
//   GlobalKey<ScaffoldState> drawer;
//   HomesScreen({this.drawer, Key key}) : super(key: key);
//
//   @override
//   _HomesScreenState createState() => _HomesScreenState();
// }
//
// class _HomesScreenState extends State<HomesScreen>
//     with AutomaticKeepAliveClientMixin<HomesScreen>, TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     var homeRepository = RepositoryProvider.of<HomeRepository>(context);
//     return MultiBlocProvider(
//       providers: [
//         // BlocProvider(
//         //   create: (context) => NewsCommonBloc(homeRepository: homeRepository),
//         // ),
//         // BlocProvider(
//         //   create: (context) => NewsNewBloc(homeRepository: homeRepository),
//         // ),
//         // BlocProvider(
//         //   create: (context) =>
//         //       NewsPromotionBloc(homeRepository: homeRepository),
//         // ),
//         // BlocProvider(
//         //   create: (context) => NewsVideoBloc(homeRepository: homeRepository),
//         // ),
//       ],
//       child: SafeArea(
//         child: Scaffold(
//           backgroundColor: AppColor.WHITE,
//           body: Column(
//             children: [
//               _buildAppbar(),
//           Stack(
//             children: [
//               SingleChildScrollView(
//                 physics: BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: MediaQuery.of(context).size.height - 100,
//                       width: MediaQuery.of(context).size.width,
//                       margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                       child: _buildBannerOne(),
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height / 12,
//                       color: Colors.black87,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 20),
//                         child: Row(
//                           children: [
//                             Expanded(
//                                 flex: 8,
//                                 child: Text(
//                                   "SẢN PHẨM BÁN CHẠY",
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 16),
//                                 )),
//                             Expanded(
//                                 flex: 2,
//                                 child: Text(
//                                   "Xem tất cả",
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 12),
//                                 ))
//                           ],
//                         ),
//                       ),
//                     ),
//                     _buildProductHot(),
//                     // SizedBox(height: 30,),
//                     Container(
//                       height: MediaQuery.of(context).size.height - 100,
//                       width: MediaQuery.of(context).size.width,
//                       margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                       child: _buildBannerOne(),
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height / 12,
//                       color: Colors.black87,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 20),
//                         child: Row(
//                           children: [
//                             Expanded(
//                                 flex: 8,
//                                 child: Text(
//                                   "SẢN PHẨM MỚI NHẤT",
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 16),
//                                 )),
//                             Expanded(
//                                 flex: 2,
//                                 child: Text(
//                                   "Xem tất cả",
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 12),
//                                 ))
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     _buildProductHot(),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height / 12,
//                       color: Colors.black87,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 20),
//                         child: Row(
//                           children: [
//                             Expanded(
//                                 flex: 8,
//                                 child: Text(
//                                   "TIN TỨC MỚI NHẤT",
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 16),
//                                 )),
//                             Expanded(
//                                 flex: 2,
//                                 child: Text(
//                                   "Xem tất cả",
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 12),
//                                 ))
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               _buildLogoAndCart(),
//             ],
//           ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAppbar() => WidgetAppBarMain(
//     openDrawer: () {
//       widget.drawer.currentState.openDrawer();
//     },
//     color: Colors.transparent,
//     heroSearch: true,
//   );
//   // _buildBannerOne() => BannerPages();
//   // _buildProductHot() => WidgetHomeCategoriesHot();
//   @override
//   // TODO: implement wantKeepAlive
//   bool get wantKeepAlive => true;
// }
