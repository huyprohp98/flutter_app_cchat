import 'package:flutter_app_cchat/app/constants/style/style.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_spacer.dart';
import 'package:flutter_app_cchat/utils/common/common_utils.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';

class WidgetForgotPasswordVerifyUsername extends StatelessWidget {
  final String username;

  const WidgetForgotPasswordVerifyUsername({Key key, @required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Nhập mã được gửi tới',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        WidgetSpacer(
          height: 15,
        ),
        Text(
          '${AppCommonUtils.hideUserName(username)}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
