import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/app/constants/color/color.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/news_product/widget_new_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/new_product_bloc.dart';
import 'bloc/new_product_event.dart';



class NewProductScreen extends StatefulWidget {
  NewProductScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NewProductScreenState createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewProductBloc>(context).add(LoadNewProduct());
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
                  BlocProvider.of<NewProductBloc>(context).add(RefreshNewProduct());
                  await Future.delayed(Duration(seconds: 2));
                  return true;
                },
                color: AppColor.PRIMARY_COLOR,
                backgroundColor: AppColor.THIRD_COLOR,
                // child: Container(
                //   child: Text("ok"),
                // ),

              child: Container(
                // color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                child: _buildContent(),
              ),
            ),
          ),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  Widget _buildContent() => WidgetNewProductList();
}
