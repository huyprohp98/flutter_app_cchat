import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';

class WidgetResend extends StatelessWidget {
  final Function onTap;
  final int time;
  final bool isValid;

  const WidgetResend({Key key, this.onTap, this.time, this.isValid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tmpTime = '';
    if (time < 10) {
      tmpTime = '00:0${time}';
    } else {
      tmpTime = '00:${time}';
    }
    return Container(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        children: [
          WidgetLink(
            text: !isValid
                ? '${AppLocalizations.of(context).translate('register_verify.resend')} ($tmpTime)'
                : '${AppLocalizations.of(context).translate('register_verify.resend')}',
            style: !isValid
                ? AppStyle.APP_MEDIUM_BOLD.copyWith(
                    color: AppColor.GREY,
                    decoration: TextDecoration.underline,
              fontSize: 14,
                  )
                : AppStyle.APP_MEDIUM_BOLD.copyWith(
                    color: AppColor.GREY,
                    decoration: TextDecoration.underline,
              fontSize: 14,
                  ),
            onTap: !isValid ? null : onTap,
          )
        ],
      ),
    );
  }
}
