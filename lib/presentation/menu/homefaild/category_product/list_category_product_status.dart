import 'package:flutter_app_cchat/app/constants/navigator/navigator.dart';
import 'package:flutter_app_cchat/model/entity/banner.dart';
import 'package:flutter_app_cchat/model/entity/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_spacer.dart';

class StatusListCategoryProduct extends StatelessWidget {
  final Category category;

  StatusListCategoryProduct({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.navigateCategoryPrimary(category);
        // AppNavigator.navigateForgotPassword();
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 8,
        width: MediaQuery.of(context).size.width / 8,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(15),
        //   color: Color(0xfff5dcee),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text('${post.id.toString()}'),
            Text(
              '${category.name}',
            ),
            // Image.network('${post.image}'),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
