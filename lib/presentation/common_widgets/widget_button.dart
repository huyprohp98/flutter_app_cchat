import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_cchat/app/constants/value/value.dart';

class WidgetButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final isBorder;

  const WidgetButton({Key key, this.onTap, this.text, this.isBorder, this.backgroundColor, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppValue.INPUT_FORM_HEIGHT,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor
            : AppColor.WHITE,
        border: isBorder ? Border.all(color: Colors.grey[200]) : null,
      ),

      child: GestureDetector(
        onTap: onTap,
        child: Center(
            child: Text(
          text,
          style: AppStyle.DEFAULT_MEDIUM.copyWith(color: textColor != null ? textColor : AppColor.BLACK),
        )),
      ),
    );
  }
}
