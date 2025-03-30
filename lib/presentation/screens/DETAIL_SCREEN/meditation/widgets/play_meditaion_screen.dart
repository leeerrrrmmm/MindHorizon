import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/data/models/steps_model.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/widgets/end_meditation_screen.dart';
import 'package:mind_horizon/testt/a.dart';

class PlayMeditationScreen extends StatefulWidget {
  final List<StepsModel>? steps;
  final List<Color>? colors;
  final int currentStep;
  final int curElement;
  final String stepAsset;

  const PlayMeditationScreen({
    super.key,
    required this.steps,
    required this.colors,
    required this.currentStep,
    required this.curElement,
    required this.stepAsset,
  });

  @override
  State<PlayMeditationScreen> createState() => _PlayMeditationScreenState();
}

class _PlayMeditationScreenState extends State<PlayMeditationScreen> {
  late int stepCount;
  late int listenedStepsCount;
  bool isPlaying = false;
  double curSoundPos = 0.0;
  Duration totalDuration = Duration.zero;
  Duration currentPosition = Duration.zero;
  final _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    stepCount = widget.currentStep;
    listenedStepsCount = widget.currentStep;

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
  }

  Future<void> _playPauseMusic(int step) async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource(widget.stepAsset));
    }

    _audioPlayer.onPlayerComplete.listen((event) async {
      if (mounted) {
        setState(() {
          isPlaying = false;
          curSoundPos = 0.0;

          // Увеличиваем кол-во прослушанных шагов
          if (step == listenedStepsCount) {
            listenedStepsCount++;

            // Обновляем состояние в Bloc
            context.read<MeditationBloc>().add(
              UpdateStepCount(
                id: widget.curElement,
                stepCount: listenedStepsCount,
              ),
            );
          }
        });
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EndMeditationScreen(colors: widget.colors),
          ),
        );
      }
    });

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress =
        totalDuration.inSeconds > 0
            ? currentPosition.inSeconds / totalDuration.inSeconds
            : 0.0;

    return Scaffold(
      backgroundColor: widget.colors?[7],
      body: Stack(
        children: [
          Positioned(
            left: 0,
            child: Image.asset('asset/img/lvec.png', color: widget.colors![8]),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('asset/img/rvec.png', color: widget.colors![8]),
          ),
          SizedBox(
            width: double.infinity,
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount:
                  listenedStepsCount < widget.steps!.length
                      ? listenedStepsCount + 1
                      : listenedStepsCount,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildText(
                      text: widget.steps![index].title,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: widget.colors?[9],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 155,
                            width: 155,
                            child: CircularProgressIndicator(
                              backgroundColor: widget.colors?[1],
                              color: widget.colors?[2],
                              value: progress,
                              strokeWidth: 10,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _playPauseMusic(index);
                            },
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: widget.colors?[2],
                              child: Icon(
                                isPlaying
                                    ? Icons.pause_rounded
                                    : Icons.play_arrow_rounded,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
