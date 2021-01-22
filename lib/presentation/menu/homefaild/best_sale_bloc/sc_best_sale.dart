// import 'dart:async';
//
// import 'package:base_code_project/app/auth_bloc/authentication_bloc.dart';
// import 'package:base_code_project/app/constants/barrel_constants.dart';
// import 'package:base_code_project/model/repo/barrel_repo.dart';
// import 'package:base_code_project/presentation/common_widgets/barrel_common_widgets.dart';
// import 'package:base_code_project/presentation/common_widgets/widget_appbar_main.dart';
// import 'package:base_code_project/utils/handler/http_handler.dart';
// import 'package:base_code_project/utils/locale/app_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
//
// import 'bloc.dart';
//
// class BestSaleScreen extends StatefulWidget {
//   @override
//   _BestSaleScreenState createState() => _BestSaleScreenState();
// }
//
// class _BestSaleScreenState extends State<BestSaleScreen> {
//   bool isLoading = true;
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<BestSaleBloc>(context).add(LoadBestSale());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var userRepository = RepositoryProvider.of<UserRepository>(context);
//     return BlocListener<BestSaleBloc, BestSaleState>(
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
//       child: BlocBuilder<BestSaleBloc, BestSaleState>(
//         builder: (context, state) {
//             return  Container(
//               height: MediaQuery.of(context).size.height*0.6,
//               width: MediaQuery.of(context).size.width,
//               margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//               child: Column(
//                 children: [
//                   Container(
//                     height: 50,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                         color: AppColor.PRIMARY
//                     ),
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(AppLocalizations.of(context).translate('home.hot_product').toUpperCase(), style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: AppColor.WHITE),),
//                         GestureDetector(
//                           onTap: (){
//
//                           },
//                           child: Text(AppLocalizations.of(context).translate('all.read_more'), style: AppStyle.DEFAULT_SMALL.copyWith(color: AppColor.WHITE),),
//                         )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: MediaQuery.of(context).size.height*0.6 - 50,
//                     width: MediaQuery.of(context).size.width,
//                     child: state?.productAllData?.listProduct?.length != 0 && state.productAllData.listProduct != null ?
//                     ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: state?.productAllData?.listProduct?.length,
//                         itemBuilder: (context, index) {
//                           return _buildProduct(state, index);
//                         }) : Center(child: Text("Không có sản phẩm!"),
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildProduct(BestSaleState state, int index) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.5,
//       // decoration: BoxDecoration(
//       //   border: Border.all()
//       // ),
//       padding: EdgeInsets.all(10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//               height: MediaQuery.of(context).size.height * 0.35,
//               width: MediaQuery.of(context).size.width * 0.5,
//               child: Image.network(state.productAllData.listProduct[index].image[0], fit: BoxFit.fill,),
//           ),
//           SizedBox(height: 10,),
//           Text(state.productAllData.listProduct[index].name, style: AppStyle.DEFAULT_MEDIUM,),
//           SizedBox(height: 10,),
//           Text(AppValue.APP_MONEY_FORMAT.format(state.productAllData.listProduct[index].price), style: AppStyle.DEFAULT_SMALL.copyWith(color: AppColor.RED),),
//         ],
//       ),
//     );
//   }
// }
