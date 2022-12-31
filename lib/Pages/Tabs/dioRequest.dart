import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import 'dart:convert';

class NetConfig {
  static String _playListUrl = 'https://www.deepinmusicapp.tk/personalized';
  static String _playListConmments =
      'https://www.deepinmusicapp.tk/comment/playlist?id=705123491';
  static getInfo() async {
    try {
      var response_playList = await Dio().get(_playListUrl);
      if (response_playList.statusCode == 200) {
        return response_playList;
        // print(response_playList);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class singerConfig {
  static String _hotSingerListUrl =
      'https://www.deepinmusicapp.tk/top/artists?offset=0&limit=20';
  static String _playListConmments =
      'https://www.deepinmusicapp.tk/comment/playlist?id=705123491';
  static getSinger() async {
    try {
      var response_hotSingerList = await Dio().get(_hotSingerListUrl);
      if (response_hotSingerList.statusCode == 200) {
        return response_hotSingerList;
        // print(response_playList);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class singerSongs {
  // static String singerSongurl;
  static getSingerSongs(getsingerSongurl) async {
    try {
      var response_playList = await Dio().get(getsingerSongurl);
      if (response_playList.statusCode == 200) {
        return response_playList;
        // print(response_playList);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class getplayListSongs {
  // static String singerSongurl;
  static getSingerSongs(getPlaylistSongs) async {
    try {
      var response_playList = await Dio().get(getPlaylistSongs);
      if (response_playList.statusCode == 200) {
        return response_playList;
        // print(response_playList);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class searchSongs {
  // static String singerSongurl;
  static getSingerSongs(searchKeyWord) async {
    try {
      var response_playList = await Dio().get(searchKeyWord);
      if (response_playList.statusCode == 200) {
        return response_playList;
        // print(response_playList);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
