import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Tabs/HomePage.dart';
import 'package:flutter_application_1/Pages/Tabs/Tabs.dart';

import 'package:card_swiper/card_swiper.dart';
// import 'Pages/Tabs/collagePage.dart';
import 'package:easy_container/easy_container.dart';
// import 'package:flutter_application_15/Pages/Tabs/downLoadPage.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_application_1/Pages/Tabs/dioRequest.dart';

import 'package:tab_container/tab_container.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../PlayPage.dart';

class searchResults extends StatefulWidget {
  var keyWord;
  searchResults({Key? key, required this.keyWord}) : super(key: key);

  @override
  State<searchResults> createState() => _searchResultsState();
}

class _searchResultsState extends State<searchResults> {
  TextEditingController _searchingRequest = TextEditingController();
  _funcToast() {
    if (_searchingRequest.text.trim().isEmpty) {
      Fluttertoast.showToast(
          msg: '请输入内容',
          backgroundColor: Colors.purple.withOpacity(0.8),
          textColor: Color.fromARGB(255, 49, 25, 204));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => searchResults(
          keyWord: _searchingRequest.text,
        ),
      ));
    }
    return Text('error');
  }

  String songname = 'fault';
  String singer = '汪苏泷';
  String img_url = 'fault';
  int i = 0;
  @override
  void initState() {
    super.initState();
  }

  _getsongInfo() async {
    var poemUrl = Uri.parse(
        'http://mobilecdn.kugou.com/api/v3/search/song?format=json&keyword=%E6%B1%AA%E8%8B%8F%E6%B3%B7&page=1&pagesize=20&showtype=1');
    var response = await http.get(poemUrl);
    // print('Response status:${response.statusCode}');
    // print('Response body :${response.body}');

    setState(() {
      i += 1;

      this.songname = json.decode(response.body)['data']['info'][i]['songname'];
      this.singer =
          json.decode(response.body)['relative']['singer'][i]['singername'];
      this.img_url =
          json.decode(response.body)['relative']['singer'][i]['imgurl'];
      print(this.songname);
      print(this.singer);
      print(this.img_url);
      // this._source = json.decode(response.body)['from'];
    });
  }

  @override
  Widget build(BuildContext context) {
    //例如https://www.deepinmusicapp.tk/search?keywords=汪苏泷?limit=50
    String searchKeyWord =
        'https://www.deepinmusicapp.tk/search?keywords=${widget.keyWord}';
    String searchKeyWordsinger =
        'https://www.deepinmusicapp.tk/search?keywords=${widget.keyWord}/type=100';
    String searchKeyWordalbum =
        'https://www.deepinmusicapp.tk/search?keywords=${widget.keyWord}/type=10';
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: [
            SizedBox(
              height: 23,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color:
                            Color.fromARGB(255, 27, 29, 143).withOpacity(0.3)),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 20,
                          color:
                              Color.fromARGB(255, 27, 29, 143).withOpacity(0.5),
                        ),
                      ),
                    )),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: 260,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 27, 29, 143).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(200)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // TextField(),
                        Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 27, 29, 143)
                                    .withOpacity(0.3),
                                borderRadius: BorderRadius.circular(50)),
                            width: 40,
                            height: 40,
                            child: IconButton(
                              onPressed: () {
                                _funcToast();
                              },
                              icon: Icon(
                                Icons.search_rounded,
                                color: Color.fromARGB(255, 27, 29, 143),
                                size: 25,
                              ),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 0.4,
                            ),
                            Container(
                              width: 160,
                              height: 45,
                              color: Color.fromARGB(255, 11, 10, 10)
                                  .withOpacity(0),
                              // color: Colors.blue,
                              child: Center(
                                child: TextField(
                                  controller: _searchingRequest,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                      hintText: '${widget.keyWord}',
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              _searchingRequest.clear();
                            },
                            icon: Icon(
                              Icons.cancel,
                              size: 20,
                              color: Colors.purple[100],
                            ))
                        // TextField()
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                ClipOval(
                    child: Image.asset(
                  'asstes/images/2.0x/a.jpg',
                  height: 40,
                  width: 40,
                  fit: BoxFit.fill,
                )),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            EasyContainer(
              height: 680,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TabContainer(
                  //tab区域
                  radius: 15,
                  tabExtent: 45,
                  tabEdge: TabEdge.top,
                  // unselectedTextStyle: TextStyle(
                  //   color: Colors.black,
                  // ),
                  // selectedTextStyle: TextStyle(
                  //     color: Colors.white, fontWeight: FontWeight.bold),
                  tabCurve: Curves.decelerate,
                  childPadding: EdgeInsets.all(20),
                  isStringTabs: false,
                  color: Color.fromARGB(255, 98, 33, 190).withOpacity(0.7),
                  children: [
                    Container(
                        //歌曲区域
                        child: FutureBuilder(
                      future:
                          searchSongs.getSingerSongs(searchKeyWord), //函数方法实现
                      builder: (context, snapshot) {
                        var _data = jsonDecode(snapshot.data.toString());

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: LoadingAnimationWidget.staggeredDotsWave(
                                  color: Colors.blue, size: 60));
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: _data['result']['songs'].length,
                            physics: const BouncingScrollPhysics(),
                            itemExtent: 80,
                            itemBuilder: (context, index) {
                              subtitle() {
                                var subtitle =
                                    '${_data["result"]["songs"][index]["alia"]}';
                                if (subtitle == []) {
                                  return '${_data["result"]["songs"][index]["alia"]}';
                                } else {
                                  return '${_data["result"]["songs"][index]["ar"][0]['name']}';
                                }
                              }

                              return Column(
                                children: [
                                  EasyContainer(
                                      borderStyle: BorderStyle.solid,
                                      elevation: 0,
                                      borderRadius: 15,
                                      splashColor: Colors.green,
                                      height: 80,
                                      margin: 0,
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => PlayPage(
                                                      songID:
                                                          '${_data["result"]["songs"][index]["id"]}',
                                                      playingImge:
                                                          '${_data["result"]["songs"][index]["al"]["picUrl"]}',
                                                      playingName:
                                                          '${_data["result"]["songs"][index]["name"]}',
                                                      singerName:
                                                          '${_data["artist"]['name']}',
                                                    )));
                                      },
                                      color: Colors.white.withOpacity(0),
                                      // splashColor: Color.fromARGB(255, 155, 131, 221),
                                      // color: Color.fromARGB(255, 247, 247, 247).withOpacity(0),
                                      child: ListTile(
                                          leading: ClipOval(
                                              child: Image.network(
                                            '${_data["result"]["songs"][index]["al"]["picUrl"]}',
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.fill,
                                          )),
                                          title: Text(
                                            '${_data["result"]["songs"][index]['name']}',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0)),
                                          ),
                                          subtitle: Text(
                                            subtitle(),
                                            style: TextStyle(fontSize: 10),
                                          ),
                                          trailing: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.favorite,
                                                color: Colors.grey,
                                                size: 20,
                                              )))),
                                ],
                              );
                            },
                          );
                        }
                        ;
                      },
                    )),
                    Container(
                        //歌手区域
                        child: FutureBuilder(
                      future: searchSongs.getSingerSongs(searchKeyWordsinger),
                      builder: (context, snapshot) {
                        var _data = jsonDecode(snapshot.data.toString());
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: LoadingAnimationWidget.staggeredDotsWave(
                                  color: Colors.blue, size: 60));
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemExtent: 80,
                            itemCount: _data['result']['songs'].length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  EasyContainer(
                                      borderStyle: BorderStyle.solid,
                                      elevation: 0,
                                      borderRadius: 15,
                                      splashColor: Colors.green,
                                      height: 80,
                                      margin: 0,
                                      onTap: () {},
                                      color: Colors.white.withOpacity(0),
                                      // splashColor: Color.fromARGB(255, 155, 131, 221),
                                      // color: Color.fromARGB(255, 247, 247, 247).withOpacity(0),
                                      child: ListTile(
                                          leading: ClipOval(
                                              child: Image.network(
                                            '${_data["result"]["songs"][index]["al"]["picUrl"]}',
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.fill,
                                          )),
                                          title: Text(
                                            '${_data["result"]["songs"][index]['name']}',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0)),
                                          ),
                                          subtitle: Text(
                                              '${_data["result"]["songs"][index]["ar"][0]['name']}'),
                                          trailing: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.favorite,
                                                color: Colors.grey,
                                                size: 20,
                                              )))),
                                ],
                              );
                            },
                          );
                        }
                        ;
                      },
                    )),
                    Container(
                        //专辑区域
                        child: FutureBuilder(
                      future: searchSongs.getSingerSongs(searchKeyWordalbum),
                      builder: (context, snapshot) {
                        var _data = jsonDecode(snapshot.data.toString());

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: LoadingAnimationWidget.staggeredDotsWave(
                                  color: Colors.blue, size: 60));
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemExtent: 120,
                            itemCount: _data['result']['songs'].length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  EasyContainer(
                                      borderStyle: BorderStyle.solid,
                                      elevation: 0,
                                      borderRadius: 15,
                                      splashColor: Colors.green,
                                      height: 100,
                                      margin: 0,
                                      onTap: () {
                                        //搜索结果跳转到播放页面点击事件
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => PlayPage(
                                              //参数
                                              songID:
                                                  '${_data["result"]["songs"][index]["id"]}',
                                              playingImge:
                                                  '${_data["result"]["songs"][index]["al"]["picUrl"]}',
                                              playingName:
                                                  '${_data["result"]["songs"][index]["al"]["picUrl"]}',
                                              singerName:
                                                  '${_data["result"]["songs"][index]["ar"][0]['name']}'),
                                        ));
                                      },
                                      color: Colors.white.withOpacity(0),
                                      // splashColor: Color.fromARGB(255, 155, 131, 221),
                                      // color: Color.fromARGB(255, 247, 247, 247).withOpacity(0),
                                      child: ListTile(
                                          leading: Image.network(
                                            '${_data["result"]["songs"][index]["al"]["picUrl"]}',
                                            // height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                          title: Text(
                                            '${_data["result"]["songs"][index]["al"]["picUrl"]}',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0)),
                                          ),
                                          subtitle: Text(
                                              '${_data["result"]["songs"][index]["ar"][0]['name']}'),
                                          trailing: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.grey,
                                                size: 20,
                                              )))),
                                ],
                              );
                            },
                          );
                        }
                        ;
                      },
                    )),
                  ],
                  tabs: [
                    Text('歌 曲'),
                    Text('歌 手'),
                    Text('专 辑'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
