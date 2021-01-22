import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

class WidgetProfileDetailRow extends StatelessWidget {
  final String title;
  final String content;
  final Function onTap;

  const WidgetProfileDetailRow({Key key, this.title, this.content, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          color: AppColor.PRIMARY_COLOR,
          padding:
              EdgeInsets.symmetric(horizontal: AppValue.APP_HORIZONTAL_PADDING),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: Colors.grey,
                width: 0.3,
              )),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppStyle.DEFAULT_MEDIUM_BOLD
                            .copyWith(color: AppColor.PRIMARY),
                      ),
                      WidgetSpacer(
                        height: 5,
                      ),
                      Text(
                        content,
                        style: AppStyle.DEFAULT_MEDIUM
                            .copyWith(color: AppColor.PRIMARY),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: AppColor.GREY,
                )
              ],
            ),
          ),
        ));
  }
}
