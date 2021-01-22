import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    @required this.appName,
    @required this.flavorName,
    @required this.initialRoute,
    @required this.debugTag,
    @required Widget child,
  }) : super(child: child);

  final String appName;
  final String flavorName;
  final String initialRoute;
  final bool debugTag;

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
