// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:getwidget/components/avatar/gf_avatar.dart';
// import 'Tabs.dart';
// import 'HomePage.dart';
// import 'MePage.dart';
// import 'PlayPage.dart';
// import '_playPage3.dart';

// void main() {
//   runApp(Tabs());
// }
// // 
// class Tabs extends StatefulWidget {
//   // const Tabs({Key? key}) : super(key: key);

//   @override
//   State<Tabs> createState() => _TabsState();
// }

// class _TabsState extends State<Tabs> {
//   int _currentIndex = 0;
//   List _pageList = [HomePage(), playpage(), MePage()];
//   // set _currentIndex(int _currentIndex) {}

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // builder: FlutterSomeDialog.init(),
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         bottomNavigationBar: CurvedNavigationBar(
//           index: 0,
//           color: Color.fromARGB(255, 69, 26, 161),
//           height: 90,
//           animationCurve: Curves.bounceIn,
//           onTap: (index) {
//             setState(() {
//               this._currentIndex = index;
//             });
//           },
//           // buttonBackgroundColor: Colors.white,
//           animationDuration: Duration(milliseconds: 300),
//           backgroundColor: Colors.white.withOpacity(0),
//           items: [
//             Icon(
//               Icons.home,
//               color: Colors.white,
//             ),
//             Icon(
//               Icons.play_arrow_rounded,
//               size: 100,
//               color: Colors.white,
//             ),
//             Icon(
//               Icons.person,
//               color: Colors.white,
//             ),
//           ],
//         ),
//         body: this._pageList[this._currentIndex],
//       ),
//     );
//   }
// }
