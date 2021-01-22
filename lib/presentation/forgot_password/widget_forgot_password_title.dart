import 'package:flutter_app_cchat/app/constants/color/color.dart';
import 'package:flutter_app_cchat/app/constants/style/style.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_spacer.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';

class WidgetForgotPasswordTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WidgetSpacer(
            height: 45,
          ),
          Text(
            AppLocalizations.of(context)
                    .translate('forgot_password.message')
                    ?.toUpperCase() ??
                "",
            style: AppStyle.DEFAULT_MEDIUM
                .copyWith(color: AppColor.PRIMARY, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          WidgetSpacer(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)
                .translate('forgot_password.sub_message'),
            style: AppStyle.DEFAULT_MEDIUM,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
