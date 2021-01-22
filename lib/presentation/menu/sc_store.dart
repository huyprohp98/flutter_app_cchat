import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StorePage extends StatefulWidget {
  StorePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _StorePage createState() => _StorePage();
}

class _StorePage extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    //   statusBarColor: Colors.red,
    // ));
    return Scaffold(
      body: Center(
        child: Text("Store"),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
