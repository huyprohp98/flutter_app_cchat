import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/category_product/category_product_sc.dart';

class AppDrawer extends StatefulWidget {
  // final Function action;
  // final Function menu;
  // final Function notification;
  // final Function account;
  final GlobalKey<ScaffoldState> drawer;
  AppDrawer(
      // {this.action, this.account, this.menu, this.notification, this.drawer});
      {this.drawer});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width /8,
      //     height: MediaQuery.of(context).size.height,
      // width: 10,
      color: Colors.white,
      child: _buiderCategoryProduct(),
    ));
  }

  // Widget _createHeader() {
  //   return DrawerHeader(
  //       margin: EdgeInsets.zero,
  //       padding: EdgeInsets.zero,
  //       decoration: BoxDecoration(color: Colors.red),
  //       child: Stack(children: <Widget>[
  //         Positioned(
  //           top: 25.0,
  //           left: 20.0,
  //           child: Text(
  //             'Memory Life',
  //             style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 22,
  //                 color: Colors.white),
  //           ),
  //         ),
  //         Positioned(
  //           top: 80.0,
  //           left: 20.0,
  //           child: GestureDetector(
  //             onTap: () {
  //               widget.account(page: 4);
  //               Navigator.pop(context);
  //             },
  //             child: Container(
  //               height: 44,
  //               width: 44,
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(500),
  //                 child: Image.asset(
  //                   "assets/images/logo_linh_anh.png",
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         Positioned(
  //           top: 90.0,
  //           left: 75.0,
  //           child: Text(
  //             "Huyentruong@gmail.com",
  //             style: TextStyle(fontSize: 12, color: Colors.white),
  //           ),
  //         ),
  //       ]));
  // }

  Widget _createDrawerItem(
      {AssetImage icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          ImageIcon(
            icon,
            color: Colors.blue,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
      onTap: onTap,
      dense: true,
    );
  }
}

_buiderCategoryProduct() => CategoryProductPages();
