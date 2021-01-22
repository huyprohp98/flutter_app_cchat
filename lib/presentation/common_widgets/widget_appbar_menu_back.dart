import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

class WidgetAppbarMenuBack extends StatelessWidget {
  final Function onTap;

  const WidgetAppbarMenuBack({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: AppValue.ACTION_BAR_HEIGHT * 0.2),
        width: AppValue.ACTION_BAR_HEIGHT * 0.8,
        height: AppValue.ACTION_BAR_HEIGHT * 0.8,
        child: WidgetAppbarMenu(
          icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),
          onTap: onTap ??
              () {
                AppNavigator.navigateBack();
              },
        ));
  }
}
