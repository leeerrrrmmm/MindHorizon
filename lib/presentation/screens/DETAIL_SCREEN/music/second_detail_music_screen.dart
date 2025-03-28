import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mind_horizon/components/build_text.dart';

class DetailMusicScreen extends StatefulWidget {
  final String categoryTitle;
  final String? soundsTitle;
  final String musicAsset;

  const DetailMusicScreen({
    super.key,
    required this.categoryTitle,
    required this.soundsTitle,
    required this.musicAsset,
  });

  @override
  State<DetailMusicScreen> createState() => _DetailMusicScreenState();
}

class _DetailMusicScreenState extends State<DetailMusicScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  double curSoundPos = 0.0;
  Duration totalDuration = Duration.zero;
  Duration currentPosition = Duration.zero;

  @override
  void initState() {
    super.initState();

    _audioPlayer.onDurationChanged.listen((duration) {
      if (mounted) {
        setState(() {
          totalDuration = duration;
        });
      }
    });

    _audioPlayer.onPositionChanged.listen((position) {
      if (mounted) {
        setState(() {
          currentPosition = position;
          curSoundPos = position.inSeconds.toDouble();
        });
      }
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      if (mounted) {
        setState(() {
          isPlaying = false;
          curSoundPos = 0.0;
        });
      }
    });
  }

  Future<void> _playPauseMusic() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource(widget.musicAsset));
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  Future<void> _seekToPosition(double seconds) async {
    await _audioPlayer.seek(Duration(seconds: seconds.toInt()));
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8ecd6),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            // BACKGROUND IMG
            Positioned(top: 0, child: Image.asset('assets/img/flow.png')),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('assets/img/botFlow.png'),
            ),
            Positioned(
              top: 270,
              right: 50,
              child: Image.asset('assets/img/o.png'),
            ),
            Positioned(
              top: 270,
              right: 55,
              child: Image.asset('assets/img/oo.png'),
            ),
            Positioned(
              top: 270,
              right: 60,
              child: Image.asset('assets/img/ooo.png'),
            ),
            Positioned(
              top: 270,
              right: 60,
              child: Image.asset('assets/img/oooo.png'),
            ),
            Positioned(
              top: 65.0,
              left: 46.0,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.keyboard_arrow_left_sharp,
                  size: 40,
                  color: Color(0xfffea386),
                ),
              ),
            ),
            Positioned(
              top: 80.0,
              left: 150.0,
              child: Text(
                'MindHorizon',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Color(0xfffea386),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 77.0),
                    child: Column(
                      children: [
                        BuildText(
                          text: widget.categoryTitle,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Color(0xfffea386),
                        ),
                        BuildText(
                          text: widget.soundsTitle!,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xfffea386),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 244,
                    height: 244,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xfffea386),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 50.0,
                          left: 50.0,
                          child: Container(
                            width: 144,
                            height: 144,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 204, 102, 95),
                                  blurRadius: 40,
                                  spreadRadius: 10,
                                ),
                              ],
                              shape: BoxShape.circle,
                              color: Color(0xfffbe7c3),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 400,
                      height: 188,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xfffea386).withOpacity(0.1),
                      ),
                      child: Column(
                        children: [
                          Slider(
                            activeColor: Color(0xfffea386),
                            inactiveColor: Color(0xffbdbdbd),
                            min: 0,
                            max: totalDuration.inSeconds.toDouble(),
                            value: curSoundPos,
                            onChanged: (val) {
                              setState(() {
                                curSoundPos = val;
                              });
                              _seekToPosition(val);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${currentPosition.inMinutes}:${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}",
                                ),
                                Text(
                                  "${totalDuration.inMinutes}:${(totalDuration.inSeconds % 60).toString().padLeft(2, '0')}",
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 35,
                                child: Image.asset(
                                  'assets/img/prev.png',
                                  scale: 0.9,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 11.0,
                                  right: 11.0,
                                ),
                                child: GestureDetector(
                                  onTap: _playPauseMusic,
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xfffea386),
                                    radius: 42.5,
                                    child:
                                        isPlaying
                                            ? Icon(
                                              Icons.pause,
                                              color: Colors.white,
                                              size: 40,
                                            )
                                            : Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8.0,
                                              ),
                                              child: Image.asset(
                                                'assets/img/play.png',
                                                scale: 0.9,
                                              ),
                                            ),
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 35,
                                child: Image.asset(
                                  'assets/img/next.png',
                                  scale: 0.9,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
