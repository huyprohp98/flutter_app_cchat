import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

class WidgetAppbar extends StatefulWidget {
  final String title;
  final List<Widget> left;
  final List<Widget> right;
  final Color indicatorColor;
  final bool hasIndicator;

  WidgetAppbar(
      {Key key,
      this.title,
      this.left,
      this.right,
      this.indicatorColor,
      this.hasIndicator = false})
      : super(key: key);

  @override
  _WidgetAppbarState createState() => _WidgetAppbarState();
}

class _WidgetAppbarState extends State<WidgetAppbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          height: AppValue.ACTION_BAR_HEIGHT,
          child: Stack(
            children: [
              widget.left != null
                  ? Positioned.fill(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: widget.left,
                      ),
                    )
                  : SizedBox(),
              widget.right != null
                  ? Positioned.fill(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: widget.right,
                      ),
                    )
                  : SizedBox(),
              widget.title != null
                  ? Positioned.fill(
                      child: FractionallySizedBox(
                          widthFactor: .8,
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 60,top: 13),
                                  height: AppValue.ACTION_BAR_HEIGHT * 1.25,
                                  child: Text(
                                    widget.title.toUpperCase(),
                                    style: AppStyle.DEFAULT_MEDIUM.copyWith(
                                        color: AppColor.BLACK,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  // child: Center(
                                  // ),
                                ),
                              ],
                            ),
                          )),
                    )
                  : SizedBox(),
            ],
          ),
        ),
        widget.hasIndicator
            ? Divider(
                height: 1,
                thickness: 1,
                color: widget.indicatorColor != null
                    ? widget.indicatorColor
                    : Colors.grey,
              )
            : WidgetSpacer(
                height: 0,
              )
      ],
    );
  }
}
