import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InformationPage extends StatefulWidget {
  InformationPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _InformationPage createState() => _InformationPage();
}

class _InformationPage extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    //   statusBarColor: Colors.red,
    // ));
    return Scaffold(
      body: Center(
        child: Text("Information"),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
