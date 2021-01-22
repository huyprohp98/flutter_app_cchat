import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter/material.dart';

class WidgetBadge extends StatelessWidget {
  final int badge;

  const WidgetBadge({Key key, this.badge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 4,
      right: 4,
      child: Align(
        alignment: Alignment.topRight,
        child: FractionallySizedBox(
          widthFactor: 0.40,
          heightFactor: 0.40,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(500)),
            child: Center(
                child: Text(
              '$badge',
              style: AppStyle.DEFAULT_VERY_SMALL
                  .copyWith(color: AppColor.WHITE, fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
