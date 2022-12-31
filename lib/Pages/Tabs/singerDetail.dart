import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:easy_container/easy_container.dart';
import 'MePage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'dioRequest.dart';
import 'dart:convert';
import 'PlayPage.dart';
import 'Tabs.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class singerDetail extends StatefulWidget {
  String singerImage;
  String alias;
  String detail;
  var albumSize;
  var songSize;
  var singerID;
  singerDetail(
      {Key? key,
      this.singerImage = '',
      this.albumSize = '',
      this.songSize = '',
      this.alias = '',
      this.singerID,
      this.detail = ''})
      : super(key: key);

  @override
  State<singerDetail> createState() => _singerDetailState();
}

class _singerDetailState extends State<singerDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.singerID);
  }

  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    String getsingerSongurl = //歌手单曲
        'https://www.deepinmusicapp.tk/artists?id=${widget.singerID}';

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
              centerTitle: true,
              elevation: 0,
              primary: true,
              shadowColor: Color.fromARGB(255, 127, 2, 200).withOpacity(0),
              backgroundColor: Color.fromARGB(255, 127, 2, 200).withOpacity(0),
              title: Text(
                '${widget.detail}',
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
                  //顶部大矩形
                  margin: 0,
                  height: 240,

                  elevation: 0,
                  width: 600,
                  child: Row(
                    children: [
                      EasyContainer(
                        height: 230,
                        elevation: 15,
                        width: 200,
                        onTap: (() {}),
                        splashColor: Colors.green,
                        margin: 0,
                        child: Image(
                            image: NetworkImage(
                              //歌手头像
                              '${widget.singerImage}',
                            ),
                            fit: BoxFit.fill),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EasyContainer(
                            color: Color.fromARGB(255, 80, 23, 187)
                                .withOpacity(0.5),
                            height: 350,
                            width: 180,
                            onTap: () {},
                            splashColor: Colors.green,
                            elevation: 15,
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                Text(
                                  '${widget.detail}',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                                //歌手信息
                                Text(
                                  '${widget.alias.toString()}',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),

                                Text(
                                  '专辑：${widget.albumSize}',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                Text(
                                  '歌曲：${widget.songSize}',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                FutureBuilder(
                                  future: singerSongs
                                      .getSingerSongs(getsingerSongurl),
                                  builder: (context, snapshot) {
                                    var _discribe =
                                        jsonDecode(snapshot.data.toString());
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child: LoadingAnimationWidget
                                              .staggeredDotsWave(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  size: 30));
                                    } else {
                                      return Text(
                                        '${_discribe["artist"]["briefDesc"]}',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      );
                                    }
                                    ;
                                  },
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EasyContainer(
                      //歌曲展示
                      height: 420,
                      elevation: 0,
                      width: 500,
                      child: FutureBuilder(
                        future: singerSongs.getSingerSongs(
                            'https://www.deepinmusicapp.tk/artists?id=${widget.singerID}'),
                        builder: (context, snapshot) {
                          var widget;
                          var _data = jsonDecode(snapshot.data.toString());

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: LoadingAnimationWidget.staggeredDotsWave(
                                    color: Colors.blue, size: 90));
                          } else {
                            return EasyContainer(
                              //歌手歌曲大矩形

                              elevation: 7,
                              color: Color.fromARGB(255, 255, 255, 255),
                              onTap: () {},
                              height: 400,
                              width: 800,
                              margin: 0,
                              borderRadius: 20,
                              shadowColor:
                                  const Color.fromARGB(255, 79, 23, 233)
                                      .withOpacity(0.7),
                              splashColor: Colors.green,
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: 30,
                                  // itemExtent: 110,
                                  itemBuilder: (context, index) {
                                    return EasyContainer(
                                      height: 90,
                                      width: 460,
                                      color: const Color.fromARGB(
                                          255, 140, 94, 214),
                                      borderRadius: 20,
                                      elevation: 10,
                                      splashColor: Colors.green,
                                      onTap: () {
                                        //播放歌曲点击事件
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => PlayPage(
                                                      playingImge:
                                                          "${_data['hotSongs'][index]["al"]["picUrl"]}",
                                                      playingName:
                                                          '${_data['hotSongs'][index]['name']}',
                                                      musicUrl: '',
                                                      songID:
                                                          '${_data['hotSongs'][index]["id"]}',
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
                                              fontSize: 10,
                                              color: Colors.white),
                                        ),
                                        trailing: IconButton(
                                          icon: Icon(Icons.favorite),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PlayPage(
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
                                  }),
                            );
                          }
                        },
                      )),
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
    ;
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


// ListView.builder(
//                         itemCount: 100,
//                         scrollDirection: Axis.vertical,
//                         padding: EdgeInsets.all(10),
//                         physics: const BouncingScrollPhysics(),
//                         itemBuilder: ((context, index) {
//                           return EasyContainer(
//                             height: 90,
//                             width: 460,
//                             color: Color.fromARGB(255, 140, 94, 214),
//                             borderRadius: 20,
//                             elevation: 10,
//                             splashColor: Colors.green,
//                             onTap: () {},
//                             child: ListTile(
//                               leading: Image(
//                                   height: 42,
//                                   width: 42,
//                                   image: NetworkImage(
//                                       "https://tse3-mm.cn.bing.net/th/id/OIP-C.JGQwynuqjyQrOkm7xTsXGgHaJ4?pid=ImgDet&rs=1"),
//                                   fit: BoxFit.cover),
//                               title: Text('一笑倾城'),
//                               subtitle: Text('汪苏泷'),
//                               trailing: IconButton(
//                                 icon: Icon(Icons.play_arrow_rounded),
//                                 onPressed: () {},
//                               ),
//                             ),
//                           );
//                         })),
// // https://www.deepinmusicapp.tk/artists?id=5538