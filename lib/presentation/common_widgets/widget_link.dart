import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter/material.dart';

class WidgetLink extends StatelessWidget {
  final String text;
  final Function onTap;
  final TextStyle style;

  WidgetLink({Key key, this.text, this.onTap, this.style});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(text,
          style: style ??
              AppStyle.APP_MEDIUM_BOLD.copyWith(
                color: Colors.black,
                decoration: TextDecoration.underline,
              )),
    );
  }
}
