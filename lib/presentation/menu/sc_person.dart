import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PersonPage extends StatefulWidget {
  PersonPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PersonPage createState() => _PersonPage();
}

class _PersonPage extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.red,
    ));
    return Scaffold(
      body: Center(
        child: Text("Person"),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
