import 'package:flutter_app_cchat/app/constants/navigator/navigator.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_link.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';

class WidgetBottomLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Text(
              AppLocalizations.of(context).translate('register.have_account'),
            ),
          ),
          Flexible(
            child: GestureDetector(
              onTap: () {
                AppNavigator.navigateLogin();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: WidgetLink(
                  text:
                      AppLocalizations.of(context).translate('register.login'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
