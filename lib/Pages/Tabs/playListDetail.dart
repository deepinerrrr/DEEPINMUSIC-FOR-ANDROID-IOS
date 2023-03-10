import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:easy_container/easy_container.dart';

class singerDetail extends StatefulWidget {
  const singerDetail({Key? key}) : super(key: key);

  @override
  State<singerDetail> createState() => _singerDetailState();
}

class _singerDetailState extends State<singerDetail> {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Color.fromARGB(255, 97, 10, 185),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Container(
          height: 1620,
          color: Colors.white,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              primary: true,
              shadowColor: Color.fromARGB(255, 127, 2, 200).withOpacity(0),
              backgroundColor: Color.fromARGB(255, 127, 2, 200).withOpacity(0),
              title: const Text(
                'Details',
                style: TextStyle(
                  color: Color.fromARGB(255, 58, 41, 190),
                ),
              ),
              leading: IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 10),
                      child: Icon(
                        value.visible ? Icons.clear : Icons.menu,
                        color: Color.fromARGB(255, 58, 41, 190),
                        size: 30,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
            ),
            body: Column(
              children: [
                EasyContainer(
                  //???????????????
                  margin: 0,
                  height: 240,

                  elevation: 0,
                  width: 600,
                  child: Row(
                    children: [
                      EasyContainer(
                        height: 230,
                        // width: 300,
                        margin: 0,
                        child: Image(
                            image: NetworkImage(
                              'https://tse3-mm.cn.bing.net/th/id/OIP-C.JGQwynuqjyQrOkm7xTsXGgHaJ4?pid=ImgDet&rs=1',
                            ),
                            fit: BoxFit.contain),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 200,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Text('?????????'),
                                  SizedBox(
                                    height: 140,
                                  ),
                                  Row(
                                    children: [
                                      Text('????????????'),
                                      Text('????????????'),
                                      Text('????????????'),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EasyContainer(
                    //????????????
                    height: 420,

                    elevation: 0,
                    width: 500,
                    child: ListView.builder(
                        itemCount: 100,
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.all(10),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return EasyContainer(
                            height: 90,
                            width: 460,
                            color: Color.fromARGB(255, 140, 94, 214),
                            borderRadius: 20,
                            elevation: 10,
                            splashColor: Colors.green,
                            onTap: () {},
                            child: ListTile(
                              leading: Image(
                                  height: 42,
                                  width: 42,
                                  image: NetworkImage(
                                      "https://tse3-mm.cn.bing.net/th/id/OIP-C.JGQwynuqjyQrOkm7xTsXGgHaJ4?pid=ImgDet&rs=1"),
                                  fit: BoxFit.cover),
                              title: Text('????????????'),
                              subtitle: Text('?????????'),
                              trailing: IconButton(
                                icon: Icon(Icons.play_arrow_rounded),
                                onPressed: () {},
                              ),
                            ),
                          );
                        })),
                  ),
                )
              ],
            ),
          )),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 64.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Image(
                      image: NetworkImage(
                        'https://tse3-mm.cn.bing.net/th/id/OIP-C.JGQwynuqjyQrOkm7xTsXGgHaJ4?pid=ImgDet&rs=1',
                      ),
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(Icons.brush_rounded),
                    title: Text(
                      '??????',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '?????????...',
                      style: TextStyle(fontSize: 8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(Icons.account_circle_rounded),
                    title: Text('???'),
                    subtitle: Text('deepin__', style: TextStyle(fontSize: 8)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(Icons.favorite),
                    title: Text('??????'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(Icons.settings),
                    title: Text('??????'),
                  ),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('deepin?????? | Vision 1.0.0'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
// Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//                 height: 250,
//                 width: 500,
//                 child: Image(
//                   image: NetworkImage(
//                     'https://tse3-mm.cn.bing.net/th/id/OIP-C.JGQwynuqjyQrOkm7xTsXGgHaJ4?pid=ImgDet&rs=1',
//                   ),
//                   fit: BoxFit.cover,
//                 )),
//           ],
//         ),