import 'package:flutter_app_cchat/app/constants/style/style.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_spacer.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';

class WidgetForgotPasswordResetTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)
                .translate('forgot_password_reset.sub_message')
                .toUpperCase(),
            style: AppStyle.DEFAULT_MEDIUM_BOLD,
            textAlign: TextAlign.center,
          ),
          WidgetSpacer(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context)
                .translate('forgot_password_reset.message'),
            style: AppStyle.DEFAULT_MEDIUM,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
