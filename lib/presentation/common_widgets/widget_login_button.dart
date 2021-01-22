import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter/material.dart';

class WidgetLoginButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final isEnable;

  const WidgetLoginButton({Key key, this.onTap, this.text, this.isEnable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: 50,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: isEnable
              ? AppColor.BUTTON_ENABLE_COLOR
              : AppColor.BUTTON_DISABLE_COLOR,
          child: Center(
              child: Text(
            text,
            style: isEnable
                ? AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.WHITE)
                : AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.BLACK),
          )),
        ),
      ),
    );
  }
}
