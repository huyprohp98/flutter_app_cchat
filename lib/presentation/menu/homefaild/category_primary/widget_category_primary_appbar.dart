import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

class WidgetCategoryPrimaryAppbar extends StatelessWidget {
  final String text;

  const WidgetCategoryPrimaryAppbar({Key key,@required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WidgetAppbar(
        title: text,
        left: [WidgetAppbarMenuBack()],
      ),
    );
  }
}
