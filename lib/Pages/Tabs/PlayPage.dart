// This is a minimal example demonstrating a play/pause button and a seek bar.
// More advanced examples demonstrating other features can be found in the same
// directory as this example in the GitHub repository.
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_container/easy_container.dart';
import 'dart:convert';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'common.dart';
import 'package:rxdart/rxdart.dart';
import 'dioRequest.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loop_page_view/loop_page_view.dart';

void main() {
  runApp(PlayPage());
}

class PlayPage extends StatefulWidget {
  var playingImge;
  var playingName;
  var musicUrl;
  var singerName;
  var songID;
  PlayPage(
      {Key? key,
      this.musicUrl,
      this.playingImge,
      this.playingName,
      this.songID,
      this.singerName})
      : super(key: key);

  @override
  PlayPageState createState() => PlayPageState();
}

class PlayPageState extends State<PlayPage> with WidgetsBindingObserver {
  final _player = AudioPlayer();
  // var realSongUrl = getSongsUrl
  //     .getSingerSongs('https://www.deepinmusicapp.tk/song/url?id=33894312');

  @override
  void initState() {
    super.initState();
    ambiguate(WidgetsBinding.instance)!.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _init();
  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    var songIDUrl =
        'https://www.deepinmusicapp.tk/song/url?id=${widget.songID}';
    var realSongUrl = getSongsUrl1.getSingerSongs(songIDUrl);
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('出错了: $e');
    });
    // Try to load audio from a source and catch any errors.
    try {
      // AAC example: https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.aac
      await _player.setAudioSource(AudioSource.uri(Uri.parse(
          "http://m7.music.126.net/20221231112430/d438439aa96dffe6db1f2835a45e4d42/ymusic/0fd6/4f65/43ed/a8772889f38dfcb91c04da915b301617.mp3")));
      //音乐播放地址，例如https://www.deepinmusicapp.tk/song/url?id=33894312
    } catch (e) {
      print("错误: $e");
    }
  }

  @override
  void dispose() {
    ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }

  /// Collects the data useful for displaying in a seek bar, using a handy
  /// feature of rx_dart to combine the 3 streams of interest into one.
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    // late final songID =
    //     'https://www.deepinmusicapp.tk/song/url?id=${widget.songID}';
    // late final realSongUrl = getSongsUrl.getSingerSongs(songID);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EasyContainer(
                    height: 70,
                    color: Colors.black,
                    borderRadius: 50,
                    child: Row(
                      children: [
                        ClipOval(
                            child: Image.network(
                          '${widget.playingImge}',
                          height: 40,
                          width: 40,
                        )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Column(
                            children: [
                              Text(
                                '${widget.playingName}',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '${widget.singerName}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: EasyContainer(
                    //pageView区域
                    height: 380,
                    color: Colors.amber.withOpacity(0),

                    // width: 300,
                    borderRadius: 15,
                    elevation: 0,
                    child: PageView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: EasyContainer(
                            onTap: () {},
                            splashColor: Colors.green,
                            elevation: 10,
                            child: Image.network('${widget.playingImge}'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: EasyContainer(
                            onTap: () {},
                            splashColor: Colors.green,
                            elevation: 10,
                            child: Text(''),
                          ),
                        )
                      ],
                    )),
              ),

              // Display play/pause button and volume/speed sliders.
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: EasyContainer(
                    //播放控件的矩形
                    height: 130,
                    elevation: 15,
                    borderRadius: 30,
                    splashColor: Colors.green,
                    onTap: () {},
                    color: Colors.white,
                    child: ControlButtons(_player)),
              ),
              // Display seek bar. Using StreamBuilder, this widget rebuilds
              // each time the position, buffered position or duration changes.
              StreamBuilder<PositionData>(
                stream: _positionDataStream,
                builder: (context, snapshot) {
                  final positionData = snapshot.data;
                  return SeekBar(
                    duration: positionData?.duration ?? Duration.zero,
                    position: positionData?.position ?? Duration.zero,
                    bufferedPosition:
                        positionData?.bufferedPosition ?? Duration.zero,
                    onChangeEnd: _player.seek,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  const ControlButtons(this.player, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Opens volume slider dialog
        IconButton(
          icon: const Icon(Icons.volume_up),
          onPressed: () {
            showSliderDialog(
              context: context,
              title: "Adjust volume",
              divisions: 10,
              min: 0.0,
              max: 1.0,
              value: player.volume,
              stream: player.volumeStream,
              onChanged: player.setVolume,
            );
          },
        ),

        /// This StreamBuilder rebuilds whenever the player state changes, which
        /// includes the playing/paused state and also the
        /// loading/buffering/ready state. Depending on the state we show the
        /// appropriate button or loading indicator.
        StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                width: 64.0,
                height: 64.0,
                child: const CircularProgressIndicator(),
              );
            } else if (playing != true) {
              return IconButton(
                icon: const Icon(Icons.play_arrow),
                iconSize: 64.0,
                onPressed: player.play,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                icon: const Icon(Icons.pause),
                iconSize: 64.0,
                onPressed: player.pause,
              );
            } else {
              return IconButton(
                icon: const Icon(Icons.replay),
                iconSize: 64.0,
                onPressed: () => player.seek(Duration.zero),
              );
            }
          },
        ),
        // Opens speed slider dialog
        StreamBuilder<double>(
          stream: player.speedStream,
          builder: (context, snapshot) => IconButton(
            icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () {
              showSliderDialog(
                context: context,
                title: "Adjust speed",
                divisions: 10,
                min: 0.5,
                max: 1.5,
                value: player.speed,
                stream: player.speedStream,
                onChanged: player.setSpeed,
              );
            },
          ),
        ),
      ],
    );
  }
}

class getSongsUrl1 {
  // static String singerSongurl;
  static getSingerSongs(songID) async {
    try {
      var songUrl = await Dio().get(songID);
      if (songUrl.statusCode == 200) {
        var _data = jsonDecode(songUrl.toString());
        var realSongUrl = _data['data'][0]['url'];
        return realSongUrl;
        // print(response_playList);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
