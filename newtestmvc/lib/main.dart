import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newtestmvc/src/view/view_landingpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends AppStatefulWidgetMVC {
  const MyApp({Key? key}) : super(key: key);
  @override
  AppStateMVC createState() => View();
}

class View extends AppStateMVC<MyApp> {
  @override
  Widget buildApp(BuildContext context) => MaterialApp(
        home: LandingPage(),
      );
}
