// import 'dart:html';
//flutter run --no-sound-null-safety
// import 'dart:html';
import 'dart:convert';
// import 'dart:js';
import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'HomePage.dart';
// import 'package:curved_drawer/curved_drawer.dart';
import 'Tabs.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/components/typography/gf_typography.dart';
import 'package:getwidget/types/gf_toggle_type.dart';
import 'package:easy_container/easy_container.dart';
import 'PlayPage.dart';
import 'package:dio/dio.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:tab_container/tab_container.dart';

List<Map> imgList = [
  {
    "url":
        "https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4wtcj?ver=1c7f"
  },
  {
    "url":
        "https://cdn.stocksnap.io/img-thumbs/960w/winter-sunshine_MYHYP62TQ2.jpg"
  },
  {"url": "https://cdn.stocksnap.io/img-thumbs/280h/PHKM6CXBLQ.jpg"},
  {
    "url":
        "https://cdn.stocksnap.io/img-thumbs/960w/flower-bouquet_X6UBKGVU0Z.jpg"
  }
];
List<CardItem> items = [
  ImageCarditem(
      image: Image.network(
          'https://cdn.stocksnap.io/img-thumbs/280h/PHKM6CXBLQ.jpg')),
  ImageCarditem(
      image: Image.network(
          'https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4wtcj?ver=1c7f')),
  ImageCarditem(
      image: Image.network(
          'https://cdn.stocksnap.io/img-thumbs/960w/winter-sunshine_MYHYP62TQ2.jpg')),
  ImageCarditem(
      image: Image.network(
          'https://cdn.stocksnap.io/img-thumbs/280h/PHKM6CXBLQ.jpg')),
  ImageCarditem(
      image: Image.network(
          'https://cdn.stocksnap.io/img-thumbs/280h/PHKM6CXBLQ.jpg')),
  ImageCarditem(
      image: Image.network(
          'https://cdn.stocksnap.io/img-thumbs/280h/PHKM6CXBLQ.jpg')),
  ImageCarditem(
      image: Image.network(
          'https://cdn.stocksnap.io/img-thumbs/280h/PHKM6CXBLQ.jpg')),
];

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);
  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mePageDetail(),
      // drawer: _drawerDemo(),flutter build apk
    );
  }
}

class mePageDetail extends StatefulWidget {
  const mePageDetail({Key? key}) : super(key: key);
  @override
  State<mePageDetail> createState() => _mePageDetailState();
}

class _mePageDetailState extends State<mePageDetail> {
  String _poem = '不我过，其啸也歌';
  String _poet = '佚名';
  String _source = '《诗经·江有汜》';
  @override
  void initState() {
    super.initState();
  }

  _getPoem() async {
    Response response =
        await Dio().get('https://v1.hitokoto.cn/?c=d&c=i&encode=json');
    var responseInfo = jsonDecode(response.data.toString());
    setState(() {
      this._poem = responseInfo["hitokoto"];
      this._poet = responseInfo['from_who'];
      this._source = responseInfo['from'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 55,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
          child: EasyContainer(
            elevation: 10,
            color: Color.fromARGB(255, 255, 255, 255),
            // focusColor: Colors.green,
            shadowColor: Color.fromARGB(255, 99, 28, 175).withOpacity(0.1),
            hoverColor: Colors.blue,
            splashColor: Colors.green,
            borderRadius: 15,
            onTap: () {
              _getPoem;
            },
            //顶部大矩形
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      child: InkWell(
                        onTap: _getPoem,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'asstes/images/4.0x/a.jpg',
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(2, 2),
                                color: Colors.grey.shade500,
                                blurRadius: 10)
                          ],
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("deepin音乐",
                        style: TextStyle(
                            fontSize: 8,
                            color:
                                Color.fromARGB(255, 7, 7, 7).withOpacity(0.5))),
                    Text(
                      'Vision_1.00',
                      style: TextStyle(
                          fontSize: 8,
                          color: Color.fromARGB(255, 7, 7, 7).withOpacity(0.5)),
                    )
                  ],
                ),
                SizedBox(
                  width: 25,
                ),
                // IconButton(onPressed: _getPoem, icon: Icon(Icons.add)),
                Container(
                    // width: 10,
                    height: 90,
                    color: Colors.blue.withOpacity(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // margin: EdgeInsets.all(2),
                          padding: EdgeInsets.all(7.5),
                          // height: 30,
                          child: Text(
                            _poem, //内容
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            style: TextStyle(
                                color: Color.fromARGB(255, 74, 26, 207),
                                fontSize: 12),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color: Color.fromARGB(255, 112, 53, 184)
                                  .withOpacity(0.3)),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          height: 25,
                          child: Text(
                            _poet + '  —— ' + _source, //出处
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            style: TextStyle(
                                color: Color.fromARGB(255, 68, 21, 197),
                                fontSize: 9),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color: Color.fromARGB(255, 112, 53, 184)
                                  .withOpacity(0.1)),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // HorizontalCardPager(
        //   initialPage: 1,
        //   onPageChanged: (page) => print("page : $page"),
        //   onSelectedItem: (page) => print("selected : $page"),
        //   items: items,
        // ),
        Container(
          height: 550,
          child: Padding(
            padding: const EdgeInsets.all(45.0),
            child: TabContainer(
              radius: 25,
              tabEdge: TabEdge.left,
              tabStart: 0,
              // tabEnd: 4,
              tabCurve: Curves.decelerate,
              childPadding: EdgeInsets.all(10),
              isStringTabs: false,
              color: Color.fromARGB(255, 136, 87, 221),
              children: [
                Container(
                  child: Text('Child 1'),
                ),
                Container(
                  child: Text('Child 2'),
                ),
                Container(
                  child: Text('Child 3'),
                ),
              ],
              tabs: [
                Icon(Icons.cloud_download_sharp),
                Icon(Icons.history_toggle_off_outlined),
                Icon(Icons.playlist_add_check_circle),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


// throw UnimplementedError();

