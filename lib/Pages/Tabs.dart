import 'package:flutter/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'Tabs/_playPage3.dart';

import 'Tabs/Tabs.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'Tabs/HomePage.dart';
import 'Tabs/MePage.dart';
import 'Tabs/PlayPage.dart';

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
// import 'package:curved_drawer/curved_drawer.dart';

void main() {
  runApp(Tabs());
}

class Tabs extends StatefulWidget {
  // const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  int index = 0;
  List _pageList = [HomePage(), PlayPage(), MePage()];

  // set _currentIndex(int _currentIndex) {}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // drawer: HomeScreen(),
        backgroundColor: Colors.white,
        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          color: Color.fromARGB(255, 36, 17, 131).withOpacity(0.8),
          onTap: (index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          height: 70,
          animationCurve: Curves.easeInOutQuart,
          animationDuration: const Duration(milliseconds: 600),
          backgroundColor: Colors.white.withOpacity(0),
          items: const [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.play_arrow_rounded,
              size: 40,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
            ),
          ],
        ),
        body: this._pageList[this._currentIndex],
      ),
    );
  }
}
