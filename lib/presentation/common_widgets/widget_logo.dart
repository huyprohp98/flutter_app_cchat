import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter/material.dart';

class WidgetLogo extends StatelessWidget {
  final double widthPercent;
  final double height;
  final bool small;

  WidgetLogo({Key key, this.widthPercent, this.height, this.small = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          Container(
            height: height ?? (AppValue.ACTION_BAR_HEIGHT * 1.25),
            child: Center(
              child: FractionallySizedBox(
                widthFactor: widthPercent ?? 0.4,
                child: Image.asset(small
                    ? 'assets/icons/ic_logo.png'
                    : 'assets/images/img_logo_horizontal.png'),
              ),
            ),
          ),
          // Container(
          //   height: height ?? (AppValue.ACTION_BAR_HEIGHT * 1.25),
          //   child: Center(
          //     child: FractionallySizedBox(
          //       widthFactor: widthPercent ?? 0.4,
          //       child: Image.asset('assets/images/logo_linh_anh.png'),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
