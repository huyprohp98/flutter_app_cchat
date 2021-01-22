import 'package:flutter_app_cchat/presentation/common_widgets/widget_appbar.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';

class WidgetRegisterVerifyAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WidgetAppbar(
        title: AppLocalizations.of(context).translate('register_verify.title'),
        left: [WidgetAppbarMenuBack()],
      ),
    );
  }
}
