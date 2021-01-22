import 'dart:async';

import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_appbar_main.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_categories_more.dart';
import 'package:flutter_app_cchat/utils/handler/http_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'banner/banner_sc.dart';
import 'home_bloc/bloc.dart';
import 'home_categories_hot/widget_home_categories_hot.dart';
import 'home_categories_hot_new_bests/widget_home_categories_hot.dart';
import 'news_product/sc_new_product.dart';

class HomeScreen extends StatefulWidget {
  GlobalKey<ScaffoldState> drawer;

  HomeScreen({this.drawer, Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeDataBloc>(context).add(LoadHomeData());
  }

  @override
  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);
    Timer(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
    return BlocListener<HomeDataBloc, HomeDataState>(
      listener: (context, state) async {
        if (state.isLoading) {
          await HttpHandler.resolve(status: state.status);
        }

        if (state.isSuccess) {
          await HttpHandler.resolve(status: state.status);
          print("_____________");
          print(state.status);
        }

        if (state.isFailure) {
          await HttpHandler.resolve(status: state.status);
          print(state.status);
        }
      },
      child: BlocBuilder<HomeDataBloc, HomeDataState>(
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height - 100,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: _buildBannerOne(),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 12,
                      color: Colors.black87,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 8,
                                child: Text(
                                  "SẢN PHẨM BÁN CHẠY",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  "Xem tất cả",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ))
                          ],
                        ),
                      ),
                    ),
                    _buildProductHot(),
                    // SizedBox(height: 30,),
                    Container(
                      height: MediaQuery.of(context).size.height - 100,
                      width: MediaQuery.of(context).size.width,
                      child: _buildBannerOne(),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 12,
                      color: Colors.black87,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 8,
                                child: Text(
                                  "SẢN PHẨM MỚI NHẤT",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  "Xem tất cả",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ))
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   height: MediaQuery.of(context).size.height - 100,
                    //   width: MediaQuery.of(context).size.width,
                    //   margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    //   child: _buildProductNewBestHot(),
                    // ),
                    _buildProductNewBest(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 12,
                      color: Colors.black87,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 8,
                                child: Text(
                                  "TIN TỨC MỚI NHẤT",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  "Xem tất cả",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      child: _buildNewProduct(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "QUY ĐỊNH ĐỔI TRẢ HÀNG",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "CHÍNH SÁCH KHÁCH HÀNG THÂN THIẾT",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "KẾT NỐI",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/img_facebook.png",width: 35,height: 35,),
                        SizedBox(width: 20,),
                        Image.asset("assets/icons/ic_insta.png",width: 35,height: 35,),
                        SizedBox(width: 20,),
                        Image.asset("assets/icons/ic_website.png",width: 35,height: 35,),
                        SizedBox(width: 20,),
                        Image.asset("assets/icons/ic_youtube.png",width: 35,height: 35,),
                      ],
                    ),
                  ],
                ),
              ),
              _buildLogoAndCart(),
            ],
          );
        },
      ),
    );
  }

  _buildLogoAndCart() => WidgetAppBarMain(
        openDrawer: () {
          widget.drawer.currentState.openDrawer();
        },
        color: Colors.transparent,
        heroSearch: true,
      );
  _buildBannerOne() => BannerPages();
  _buildProductHot() => WidgetHomeCategoriesHot();
  _buildProductNewBest() => WidgetHomeCategorieNewBestHot();
  _buildNewProduct() => NewProductScreen();
  // _buildProductNewBestHot() => CategoryProductPageNewBestPages();

// _buildProductNewBestHot() => CategoryProductNewBestPages();
}
