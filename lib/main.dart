import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_15/Pages/Tabs/HomePage.dart';
import 'Pages/Tabs.dart';
import 'Pages/Tabs/HomePage.dart';
import 'Pages/Tabs/PlayPage.dart';

import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'Pages/Tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white.withOpacity(0)));

    SystemChrome.setEnabledSystemUIOverlays([]);
    return Tabs();
  }
}
