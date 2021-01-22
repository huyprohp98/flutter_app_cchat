// import 'dart:async';
//
// import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
// import 'package:flutter_app_cchat/presentation/common_widgets/widget_appbar_main.dart';
// import 'package:flutter_app_cchat/presentation/common_widgets/widget_categories_more.dart';
// import 'package:flutter_app_cchat/utils/handler/http_handler.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'banner/banners_sc.dart';
// import 'home_bloc/bloc.dart';
// import 'home_categories_hot/widget_home_categories_hot.dart';
// import 'home_categorys_product_new_best/category_product_new_best_sc.dart';
// import 'home_categorys_product_new_best/sc_category_product_best_new.dart';
//
// class HomeScreen extends StatefulWidget {
//   GlobalKey<ScaffoldState> drawer;
//
//   HomeScreen({this.drawer, Key key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   bool isLoading = true;
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<HomeDataBloc>(context).add(LoadHomeData());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var userRepository = RepositoryProvider.of<UserRepository>(context);
//     Timer(Duration(seconds: 3), () {
//       setState(() {
//         isLoading = false;
//       });
//     });
//     return BlocListener<HomeDataBloc, HomeDataState>(
//       listener: (context, state) async {
//         if (state.isLoading) {
//           await HttpHandler.resolve(status: state.status);
//         }
//
//         if (state.isSuccess) {
//           await HttpHandler.resolve(status: state.status);
//           print("_____________");
//           print(state.status);
//         }
//
//         if (state.isFailure) {
//           await HttpHandler.resolve(status: state.status);
//           print(state.status);
//         }
//       },
//       child: BlocBuilder<HomeDataBloc, HomeDataState>(
//         builder: (context, state) {
//           return Stack(
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
//                     Container(
//                       height: MediaQuery.of(context).size.height - 100,
//                       width: MediaQuery.of(context).size.width,
//                       margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                       // child: _buildProductNewBestHot(),
//                     ),
//                     // _buildProductHot(),
//                   ],
//                 ),
//               ),
//               _buildLogoAndCart(),
//             ],
//           );
//
//           // return Scaffold(
//           //   body: SingleChildScrollView(
//           //     child: Column(
//           //       children: [
//           //         Stack(
//           //           children:[
//           //             ListView(
//           //                 children: [
//           //                   Container(
//           //                     height: MediaQuery.of(context).size.height-70,
//           //                     width: MediaQuery.of(context).size.width,
//           //                     margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//           //                     child: _buildBannerOne(),
//           //                   ),
//           //
//           //                   // Container(
//           //                   //     height: MediaQuery.of(context).size.height-70,
//           //                   //     width: MediaQuery.of(context).size.width,
//           //                   //     margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//           //                   //     child: _buildBannerTwo(state)
//           //                   // ),
//           //                   // _buildNewProduct()
//           //                 ]
//           //             ),
//           //             _buildLogoAndCart()
//           //           ] ,
//           //         ),
//           //             _buildProductHot(),
//           //       ],
//           //     ),
//           //   ),
//           // );
//         },
//       ),
//     );
//   }
//
//   _buildLogoAndCart() => WidgetAppBarMain(
//         openDrawer: () {
//           widget.drawer.currentState.openDrawer();
//         },
//         color: Colors.transparent,
//         heroSearch: true,
//       );
//   // Widget _buildBannerOne(HomeDataState state) {
//   //   if (state?.homeData?.listBanner?.length != 0 && state?.homeData?.listBanner != null) {
//   //     return  Swiper(
//   //       itemBuilder: (BuildContext context, int index) {
//   //         return Image.network(state.homeData.listBanner[index].image, fit: BoxFit.fill,);
//   //       },
//   //       autoplay: false,
//   //       itemCount: state.homeData.listBanner.length-1,
//   //       pagination: new SwiperPagination(),
//   //       control: new SwiperControl(
//   //         iconNext: null,
//   //         iconPrevious: null
//   //       ),
//   //     );
//   //   } else {
//   //     return isLoading ? Center(child: WidgetCircleProgress()) : Center(child: Text("Bạn chưa có nhật ký!"));
//   //   }
//   // }
//
//   // Widget _buildBannerTwo(HomeDataState state) {
//   //   if (state?.homeData?.listBanner?.length != 0 && state?.homeData?.listBanner != null) {
//   //     return Image.network(state.homeData.listBanner.last.image, fit: BoxFit.fill);
//   //   } else {
//   //     return isLoading ? Center(child: WidgetCircleProgress()) : Center(child: Text("Bạn chưa có nhật ký!"));
//   //   }
//   // }
//
//   // _buildLogoAndCart() => WidgetAppBarMain(
//   //   openDrawer: () {
//   //     widget.drawer.currentState.openDrawer();
//   //   },
//   //   color: Colors.transparent,
//   //   heroSearch: true,
//   // );
//
//   // _buildBestSoldProduct() => BestSaleScreen();
//   //
//   // _buildNewProduct() => NewProductScreen();
//   _buildBannerOne() => BannerPages();
//   _buildProductHot() => WidgetHomeCategoriesHot();
//   // _buildProductNewBestHot() => CategoryProductPageNewBestPages();
//
// // _buildProductNewBestHot() => CategoryProductNewBestPages();
// }
