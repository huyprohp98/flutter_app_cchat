import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_circle_progress.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    openLogin();
  }

  Widget build(BuildContext context) {
    // var userRepository = RepositoryProvider.of<UserRepository>(context);
    // openLogin();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Container(
          //   width: double.infinity,
          //   height: MediaQuery.of(context).size.height,
          //   child: Image.asset(
          //     'assets/images/background_linh_anh.jpg',
          //     fit: BoxFit.fill,
          //   ),
          // ),
Container(
  width: double.infinity,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColor.PRIMARY_COLOR,
        Colors.white,
        AppColor.PRIMARY_COLOR
      ],
      tileMode: TileMode.repeated,
    ),
  ),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [_buildLogo(), _buildProgress()],
),
),

        ],
      ),
    );
  }

  _buildLogo() => WidgetLogo(
    height: Get.width * 0.63,
    widthPercent: 0.63,
  );

  _buildProgress() => WidgetCircleProgress();

  void openLogin() async {
    Future.delayed(Duration(seconds: 3), () {
      AppNavigator.navigateNavigation();
    });
  }
}