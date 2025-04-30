import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/data/models/sounds_model.dart';

@immutable
class DetailMusicScreen extends StatefulWidget {
  final String categoryTitle;
  final String? soundsTitle;
  final List<SoundsModel> soundsList;
  final int initialElemId;

  const DetailMusicScreen({
    super.key,
    required this.categoryTitle,
    required this.soundsTitle,
    required this.soundsList,
    required this.initialElemId,
  });

  @override
  State<DetailMusicScreen> createState() => _DetailMusicScreenState();
}

class _DetailMusicScreenState extends State<DetailMusicScreen> {
  late String musicAsset;
  late int curElemId;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  double curSoundPos = 0.0;
  Duration totalDuration = Duration.zero;
  Duration currentPosition = Duration.zero;

  @override
  void initState() {
    super.initState();
    curElemId = widget.initialElemId;
    musicAsset = widget.soundsList[curElemId].musicAsset;

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

  void _playNext() async {
    setState(() {
      curElemId = (curElemId + 1) % widget.soundsList.length;
      musicAsset = widget.soundsList[curElemId].musicAsset;

      curSoundPos = 0.0;
      currentPosition = Duration.zero;
      isPlaying = false;
    });

    await _audioPlayer.stop();
  }

  void _playPrev() async {
    setState(() {
      curElemId = (curElemId - 1) % widget.soundsList.length;
      musicAsset = widget.soundsList[curElemId].musicAsset;

      curSoundPos = 0.0;
      currentPosition = Duration.zero;
      isPlaying = false;
    });

    await _audioPlayer.stop();
  }

  Future<void> _playPauseMusic() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource(musicAsset));
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
      backgroundColor: const Color(0xfff8ecd6),
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
              top: 270.h,
              right: 64.w,
              child: Image.asset('assets/img/o.png', scale: 1.2.h),
            ),
            Positioned(
              top: 270.h,
              right: 64.w,
              child: Image.asset('assets/img/oo.png', scale: 1.2.h),
            ),
            Positioned(
              top: 270.h,
              right: 64.w,
              child: Image.asset('assets/img/ooo.png', scale: 1.2.h),
            ),
            Positioned(
              top: 270.h,
              right: 64.w,
              child: Image.asset('assets/img/oooo.png', scale: 1.2.h),
            ),
            Positioned(
              top: 60.h,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_left_sharp,
                    size: 40,
                    color: const Color(0xfffea386),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 70.h,
              right: 0,
              left: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: const Text(
                  'MindHorizon',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Color(0xfffea386),
                  ),
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
                          color: const Color(0xfffea386),
                        ),
                        BuildText(
                          text: widget.soundsList[curElemId].title,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xfffea386),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 244,
                    height: 244,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xfffea386),
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
                                  color: const Color.fromARGB(
                                    255,
                                    204,
                                    102,
                                    95,
                                  ),
                                  blurRadius: 40,
                                  spreadRadius: 10,
                                ),
                              ],
                              shape: BoxShape.circle,
                              color: const Color(0xfffbe7c3),
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
                        color: const Color(0xfffea386).withValues(alpha: 0.1),
                      ),
                      child: Column(
                        children: [
                          Slider(
                            activeColor: const Color(0xfffea386),
                            inactiveColor: const Color(0xffbdbdbd),
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
                              GestureDetector(
                                onTap: () {
                                  _playPrev();
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 35,
                                  child: Image.asset(
                                    'assets/img/prev.png',
                                    scale: 0.9,
                                  ),
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
                                    backgroundColor: const Color(0xfffea386),
                                    radius: 42.5,
                                    child:
                                        isPlaying
                                            ? const Icon(
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
                              GestureDetector(
                                onTap: () {
                                  _playNext();
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 35,
                                  child: Image.asset(
                                    'assets/img/next.png',
                                    scale: 0.9,
                                  ),
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
