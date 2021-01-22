import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/app/constants/color/color.dart';
import 'package:flutter_app_cchat/presentation/menu/new/widget_posts.dart';
// import 'package:flutter_app_cchat/presentation/screen/menu/new/widget_home_page_posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_cchat/presentation/menu/voucher/widget_voucher_posts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/post_voucher_bloc.dart';
import 'bloc/post_voucher_event.dart';


class VoucherPages extends StatefulWidget {
  VoucherPages({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VoucherPages createState() => _VoucherPages();
}

class _VoucherPages extends State<VoucherPages> {
  @override
  void initState() {
    super.initState();
    //  BlocProvider.of<PostBloc>(context).add(LoadPost());
    BlocProvider.of<PostVoucherBloc>(context).add(LoadVoucher());
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.red,
    ));
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<PostVoucherBloc>(context).add(RefreshVoucher());
                  await Future.delayed(Duration(seconds: 2));
                  return true;
                },
                color: AppColor.PRIMARY_COLOR,
                backgroundColor: AppColor.THIRD_COLOR,
                child: _buildContent()),
          ),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  Widget _buildContent() => WidgetPostListVoucherItem();
}
