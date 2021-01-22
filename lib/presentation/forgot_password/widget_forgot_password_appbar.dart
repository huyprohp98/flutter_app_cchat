import 'package:flutter_app_cchat/presentation/common_widgets/widget_appbar.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:flutter/material.dart';

class WidgetForgotPasswordAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WidgetAppbar(
        title: "LẤY LẠI MẬT KHẨU",
        left: [WidgetAppbarMenuBack()],
      ),
    );
  }
}
