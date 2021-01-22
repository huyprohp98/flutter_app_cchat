import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/app/constants/color/color.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/banner/widget_banner_posts.dart';
import 'package:flutter_app_cchat/presentation/menu/new/widget_posts.dart';
// import 'package:flutter_app_cchat/presentation/screen/menu/new/widget_home_page_posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_appbar_main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/post_banner_bloc.dart';
import 'bloc/post_banner_event.dart';


class BannerPages extends StatefulWidget {
 // BannerPages({Key key, this.title}) : super(key: key);
 // final String title;
  final GlobalKey<ScaffoldState> drawer;
  final Function moveTab;

  BannerPages({this.drawer, this.moveTab});

  @override
  _BannerPages createState() => _BannerPages();
}

class _BannerPages extends State<BannerPages> {
  @override
  void initState() {
    super.initState();
    //  BlocProvider.of<PostBloc>(context).add(LoadPost());
    BlocProvider.of<PostBannerBloc>(context).add(LoadBanner());
  }

  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    //   statusBarColor: Colors.red,
    // ));
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: RefreshIndicator(
                    onRefresh: () async {
                      BlocProvider.of<PostBannerBloc>(context).add(RefreshBanner());
                      await Future.delayed(Duration(seconds: 2));
                      return true;
                    },
                    color: AppColor.PRIMARY_COLOR,
                    backgroundColor: AppColor.THIRD_COLOR,
                    child: _buildContent()),
              ),
            ],
          ),
          // _buildLogoAndCart()
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  Widget _buildContent() => WidgetPostListBannerItem();

  // _buildLogoAndCart() => WidgetAppBarMain(
  //   openDrawer: () {
  //     widget.drawer.currentState.openDrawer();
  //   },
  //   color: Colors.transparent,
  //   heroSearch: true,
  // );
}
