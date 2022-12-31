import 'dart:convert';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:easy_container/easy_container.dart';
import 'package:flutter_application_1/Pages/Tabs/dioRequest.dart';
import 'MePage.dart';
import 'HomePage.dart';
import 'PlayPage.dart';
import 'dioRequest.dart';

class collegePage extends StatefulWidget {
  var playListName;

  var playListImage;
  var playListID;

  collegePage({
    Key? key,
    required this.playListImage,
    required this.playListName,
    required this.playListID,
  }) : super(key: key);

  @override
  State<collegePage> createState() => _collegePageState();
}

final _advancedDrawerController = AdvancedDrawerController();

class _collegePageState extends State<collegePage> {
  @override
  Widget build(BuildContext context) {
    var getPlaylistSongs =
        'https://www.deepinmusicapp.tk/playlist/detail?id=${widget.playListID}';
    //例如：https://www.deepinmusicapp.tk/playlist/detail?id=24381616
    return AdvancedDrawer(
      backdropColor: Color.fromARGB(255, 97, 10, 185),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Container(
          height: 1620,
          color: Colors.white,
          child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                elevation: 0,
                primary: true,
                shadowColor: Color.fromARGB(255, 127, 2, 200).withOpacity(0),
                backgroundColor:
                    Color.fromARGB(255, 127, 2, 200).withOpacity(0),
                title: Text(
                  '${widget.playListName}',
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
                    child: EasyContainer(
                        child: Image.network('${widget.playListImage}')),
                  ),
                  EasyContainer(
                    child: FutureBuilder(
                      future: getplayListSongs.getSingerSongs(getPlaylistSongs),
                      builder: (context, snapshot) {
                        var _data = jsonDecode(snapshot.data.toString());
                        return ListView.builder(
                            itemCount: _data['result'].length,
                            itemBuilder: (context, index) {
                              return EasyContainer(
                                height: 90,
                                width: 460,
                                color: const Color.fromARGB(255, 140, 94, 214),
                                borderRadius: 20,
                                elevation: 10,
                                splashColor: Colors.green,
                                onTap: () {
                                  //播放歌曲点击事件
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PlayPage(
                                            playingImge:
                                                "${_data['hotSongs'][index]["al"]["picUrl"]}",
                                            playingName:
                                                '${_data['hotSongs'][index]['name']}',
                                            musicUrl: '',
                                            singerName:
                                                '${_data["artist"]['name']}',
                                          )));
                                },
                                child: ListTile(
                                  leading: ClipOval(
                                    child: Image(
                                        height: 48,
                                        width: 48,
                                        image: NetworkImage(//播放单曲图片
                                            "${_data['hotSongs'][index]["al"]["picUrl"]}"),
                                        fit: BoxFit.cover),
                                  ),
                                  title: Text(
                                    //播放单曲名
                                    '${_data['hotSongs'][index]['name']}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    //收录的专辑
                                    '${_data['hotSongs'][index]['alia'][0]}',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.favorite),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => PlayPage(
                                                    playingImge:
                                                        "${_data['hotSongs'][index]["al"]["picUrl"]}",
                                                    playingName:
                                                        '${_data['hotSongs'][index]['name']}',
                                                    musicUrl: '',
                                                    singerName:
                                                        '${_data["artist"]['name']}',
                                                  )));
                                    },
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  )
                ],
              ))),
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
                      '主题',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '还没写...',
                      style: TextStyle(fontSize: 8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(Icons.account_circle_rounded),
                    title: Text('我'),
                    subtitle: Text('deepin__', style: TextStyle(fontSize: 8)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(Icons.favorite),
                    title: Text('收藏'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MePage(),
                      ));
                    },
                    leading: Icon(Icons.settings),
                    title: Text('设置'),
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
                    child: Text('deepin音乐 | Vision 1.0.0'),
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