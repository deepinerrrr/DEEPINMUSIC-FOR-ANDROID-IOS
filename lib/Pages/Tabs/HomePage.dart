import 'dart:convert';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_application_1/Pages/Tabs/college.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Tabs/Pages/Tabs/searchResults.dart';
import 'MePage.dart';
import 'PlayPage.dart';
import 'college.dart';

import 'package:easy_container/easy_container.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'PlayPage.dart';
import 'MePage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'playList.dart';
import 'dioRequest.dart';
import 'package:dio/dio.dart';
import 'singerDetail.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // drawer:
        backgroundColor: Colors.white,
        body: _columnPage(),
      ),
    );
  }
}

class _columnPage extends StatefulWidget {
  const _columnPage({Key? key}) : super(key: key);

  @override
  State<_columnPage> createState() => __columnPageState();
}

class __columnPageState extends State<_columnPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  // String _poem = '不我过，其啸也歌';
  // String _poet = '佚名';
  String _source = '《诗经·江有汜》';
  String songname = '小星星';
  String singer = '汪苏泷';
  int i = 0;
  int a = 0;
  @override
  _getsongInfo() async {
    var poemUrl = Uri.parse(
        'https://c.y.qq.com/v8/fcg-bin/fcg_v8_toplist_cp.fcg?g_tk=5381&uin=0&format=json&inCharset=utf-8&outCharset=utf-8&notice=0&platform=h5&needNewCode=1&tpl=3&page=detail&type=top&topid=36&_=1520777874472');
    var response = await http.get(poemUrl);
    // print('Response status:${response.statusCode}');
    // print('Response body :${response.body}');
  }

  TextEditingController _searchingRequest = TextEditingController();
  _funcToast() {
    if (_searchingRequest.text.trim().isEmpty) {
      Fluttertoast.showToast(
          msg: '请输入内容',
          backgroundColor: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
          textColor: Color.fromARGB(255, 255, 255, 255));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => searchResults(
          keyWord: _searchingRequest.text,
        ),
      ));
    }
    return;
  }

  List _listImage = [
    'asstes/images/2.0x/a.jpg',
    'asstes/images/2.0x/b.jpg',
    'asstes/images/2.0x/c.jpg',
    'asstes/images/2.0x/d.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    a = 0;

    setState(() {
      a += 1;
    });
    return Column(
      children: [
        SafeArea(
          child: Container(
              //顶部大矩形
              height: 290,
              width: 600,
              // color: Colors.blue,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 71, 15, 182).withOpacity(0),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  )),
              child: Column(children: [
                SizedBox(
                  height: 23,
                ),
                SafeArea(
                  child: _topRow(),
                  left: true,
                  right: true,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 160,
                    color: Colors.amber.withOpacity(0),
                    child: Swiper(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      autoplay: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    _listImage[0],
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(15)),
                        );
                      },
                      onTap: ((index) {
                        print("点击了${index}");
                      }),
                      pagination: SwiperPagination(
                          alignment: Alignment.bottomCenter,
                          builder: DotSwiperPaginationBuilder(
                              size: 8,
                              activeSize: 12,
                              color: Colors.white,
                              activeColor: Color.fromARGB(255, 74, 24, 191))),
                      viewportFraction: 0.7,
                      scale: 0.7,
                    )),
              ])),
        ),
        EasyContainer(
          height: 320,
          //中间大矩形
          // color: Colors.red,
          elevation: 0,
          margin: 0,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 360, 0),
                child: Row(
                  children: [
                    EasyContainer(
                      color: Color.fromARGB(255, 83, 10, 179).withOpacity(0.1),
                      margin: 0,
                      splashColor: Colors.green.withOpacity(0.8),
                      onTap: (() {}),
                      elevation: 15,
                      shadowColor:
                          Color.fromARGB(255, 83, 10, 179).withOpacity(0.1),
                      borderRadius: 35,
                      child: Row(
                        children: [
                          Text(
                            '热门歌手 >>',
                            style: TextStyle(
                                color: Color.fromARGB(255, 83, 10, 179),
                                fontSize: 12),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Icon(Icons.person,
                              color: Color.fromARGB(255, 83, 10, 179))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              playList2(),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 15, 360, 0),
                child: Row(
                  children: [
                    EasyContainer(
                      color:
                          const Color.fromARGB(255, 83, 10, 179).withOpacity(0),
                      margin: 0,
                      splashColor: Colors.green.withOpacity(1),
                      onTap: (() {}),
                      elevation: 0,
                      shadowColor: const Color.fromARGB(255, 83, 10, 179)
                          .withOpacity(0.1),
                      borderRadius: 35,
                      child: Row(
                        children: const [
                          Icon(Icons.album,
                              color: Color.fromARGB(255, 83, 10, 179)),
                          SizedBox(
                            width: 4,
                          ),
                          const Text(
                            '推荐歌单 >>',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 83, 10, 179),
                                fontSize: 20),
                          ),
                          // SizedBox(
                          //   width: 4,
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              playList1(),
            ],
          ),
        ),
        EasyContainer(
          borderRadius: 90,
          // margin: -5,
          height: 100,
          elevation: 50,
          onTap: () {},
          color: Color.fromARGB(255, 92, 30, 209).withOpacity(0.1),
          splashColor: Colors.green,
          child: Row(
            children: [
              ClipOval(
                  child: Image.asset(
                //底部播放歌曲图片
                'asstes/images/2.0x/c.jpg',
                height: 70,
                width: 70,
                fit: BoxFit.fill,
              )),
              Container(
                height: 90,
                width: 120,
                child: ListTile(
                  title: Text(
                    this.songname,
                    style: TextStyle(
                        fontSize: 12, color: Color.fromARGB(255, 79, 17, 180)),
                  ),
                  subtitle: Text(
                    this.singer,
                    style: TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                        color:
                            Color.fromARGB(255, 27, 29, 143).withOpacity(0.4)),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color:
                            Color.fromARGB(255, 27, 29, 143).withOpacity(0.3)),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_previous_rounded,
                        size: 25,
                        color:
                            Color.fromARGB(255, 27, 29, 143).withOpacity(0.3),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color:
                            Color.fromARGB(255, 27, 29, 143).withOpacity(0.3)),
                    child: IconButton(
                      onPressed: _getsongInfo,
                      icon: Icon(
                        Icons.play_arrow_rounded,
                        size: 45,
                        color:
                            Color.fromARGB(255, 27, 29, 143).withOpacity(0.3),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color:
                            Color.fromARGB(255, 27, 29, 143).withOpacity(0.3)),
                    child: IconButton(
                      onPressed: _getsongInfo,
                      icon: Icon(
                        Icons.skip_next_rounded,
                        size: 25,
                        color:
                            Color.fromARGB(255, 27, 29, 143).withOpacity(0.3),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class _imagPlay extends StatefulWidget {
  const _imagPlay({Key? key}) : super(key: key);

  @override
  State<_imagPlay> createState() => __imagPlayState();
}

class __imagPlayState extends State<_imagPlay> {
  // 数据源
  final List<String> imageList = [
    'asstes/images/2.0x/a.jpg',
    'asstes/images/2.0x/b.jpg',
    'asstes/images/2.0x/c.jpg',
    'asstes/images/2.0x/d.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return GFItemsCarousel(
      rowCount: 2,
      children: imageList.map(
        (url) {
          return Container(
            // color: Colors.black,
            height: 50,
            width: 200,
            margin: EdgeInsets.all(5),
            child: Container(
              // margin: EdgeInsets.all(10),
              // padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Image.asset(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}

// 顶部搜索组件
class _topRow extends StatefulWidget {
  const _topRow({Key? key}) : super(key: key);

  @override
  State<_topRow> createState() => __topRowState();
}

var _titleTxt = new TextEditingController();
var content = _titleTxt.text;

class __topRowState extends State<_topRow> {
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
    return _topRow();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      // color: Colors.red,
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          SafeArea(
            child: Row(
              //头像
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: InkWell(
                          onTap: () {},
                          child: Image(
                              height: 42,
                              width: 42,
                              image: NetworkImage(
                                  "https://tse3-mm.cn.bing.net/th/id/OIP-C.JGQwynuqjyQrOkm7xTsXGgHaJ4?pid=ImgDet&rs=1"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 260,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 53, 2, 182).withOpacity(0.05),
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: MainAxisAlignment.center,

                      children: [
                        // TextField(),
                        Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 56, 58, 198)
                                    .withOpacity(0.3),
                                borderRadius: BorderRadius.circular(25)),
                            width: 50,
                            height: 50,
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
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Row(
                          children: [
                            SizedBox(
                              width: 3,
                            ),
                            Container(
                              width: 158,
                              height: 45,
                              color: Color.fromARGB(255, 229, 38, 38)
                                  .withOpacity(0),
                              // color: Colors.blue,
                              child: Center(
                                child: TextField(
                                  // controller: _funcToast(),
                                  // autofocus: true,
                                  // maxLength: 1,
                                  controller: _searchingRequest,
                                  enabled: true,
                                  onChanged: ((value) {}),
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                      hintText: '汪苏泷',
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
                              color: Color.fromARGB(255, 73, 26, 183)
                                  .withOpacity(0.3),
                            ))
                        // TextField()
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color:
                            Color.fromARGB(255, 53, 40, 194).withOpacity(0.2)),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          // _scan();
                        },
                        icon: Icon(
                          Icons.music_note_sharp,
                          size: 20,
                          color:
                              Color.fromARGB(255, 27, 29, 143).withOpacity(0.5),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class playList1 extends StatefulWidget {
  const playList1({Key? key}) : super(key: key);

  @override
  State<playList1> createState() => _playList1State();
}

// ignore: camel_case_types
class _playList1State extends State<playList1> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: NetConfig.getInfo(),
        builder: (context, snapshot) {
          var widget;
          var _data = jsonDecode(snapshot.data.toString());
          // var _result = Result.fromJson(_data);

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.blue, size: 60));
          } else {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: EasyContainer(
                //歌单大矩形
                elevation: 7,
                color: const Color.fromARGB(255, 142, 111, 230),
                onTap: () {},
                height: 170,
                margin: 0,
                borderRadius: 20,
                shadowColor:
                    const Color.fromARGB(255, 79, 23, 233).withOpacity(0.7),
                splashColor: Colors.green,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: _data['result'].length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            EasyContainer(
                              height: 100,
                              width: 100,
                              elevation: 0,
                              margin: 0,
                              color: Colors.white.withOpacity(0),
                              borderRadius: 20,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => collegePage(
                                    playListImage:
                                        '${_data['result'][index]['picUrl']}',
                                    playListName:
                                        '${_data['result'][index]['name']}',
                                    playListID:
                                        '${_data['result']['index']['id']}',
                                  ),
                                ));
                              },
                              child: Image.network(//歌单封面
                                  '${_data['result'][index]['picUrl']}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(3, 5, 3, 0),
                              child: Container(
                                height: 20,
                                width: 100,
                                child: Text(
                                  '${_data['result'][index]['name']}',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            );
          }
        });
  }
}

class playList2 extends StatefulWidget {
  const playList2({Key? key}) : super(key: key);

  @override
  State<playList2> createState() => _playList2State();
}

class _playList2State extends State<playList2> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: singerConfig.getSinger(),
        builder: (context, snapshot) {
          var widget;
          var _data = jsonDecode(snapshot.data.toString());

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.blue, size: 60));
          } else {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: EasyContainer(
                //歌手大矩形
                elevation: 7,
                color: const Color.fromARGB(255, 77, 57, 133),
                onTap: () {},
                height: 170,
                margin: 0,
                borderRadius: 20,
                shadowColor: Color.fromARGB(255, 79, 23, 233).withOpacity(0.7),
                splashColor: Colors.green,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: _data['artists'].length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            EasyContainer(
                              color: Colors.white.withOpacity(0),
                              elevation: 0,
                              margin: 0,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => singerDetail(
                                      singerID:
                                          '${_data['artists'][index]['id']}',
                                      songSize:
                                          '${_data['artists'][index]['musicSize']}',
                                      albumSize:
                                          '${_data['artists'][index]['albumSize']}',
                                      alias:
                                          '${_data['artists'][index]['alias']}',
                                      singerImage:
                                          '${_data['artists'][index]['picUrl']}',
                                      detail:
                                          '${_data['artists'][index]['name']}'),
                                ));
                              },
                              child: ClipOval(
                                child: Image.network(
                                  //歌手封面
                                  '${_data['artists'][index]['picUrl']}',
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    // width: 100,
                                    child: Text(
                                      '${_data['artists'][index]['name']}',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            );
          }
        });
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
      backdropColor: Colors.blueGrey,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Advanced Drawer Example'),
          leading: IconButton(
            onPressed: handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: Container(),
      ),
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
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/flutter_logo.png',
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
