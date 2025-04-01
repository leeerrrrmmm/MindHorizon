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
  List<bool> isPlayingList = [];
  Map<int, AudioPlayer> audioPlayers = {};
  Map<int, Duration> stepPositions = {};
  Map<int, Duration> stepDurations = {};
  Map<int, double> stepProgress = {};

  @override
  void initState() {
    super.initState();
    stepCount = widget.currentStep;
    listenedStepsCount = widget.currentStep;

    isPlayingList = List.generate(widget.steps!.length, (index) => false);

    // Инициализируем плееры для каждого шага
    for (int i = 0; i < widget.steps!.length; i++) {
      audioPlayers[i] = AudioPlayer();
      stepPositions[i] = Duration.zero;
      stepDurations[i] = Duration.zero;
      stepProgress[i] = 0.0;

      audioPlayers[i]!.onDurationChanged.listen((duration) {
        if (mounted) {
          setState(() {
            stepDurations[i] = duration;
          });
        }
      });

      audioPlayers[i]!.onPositionChanged.listen((position) {
        if (mounted) {
          setState(() {
            stepPositions[i] = position;
            stepProgress[i] = durationToProgress(position, stepDurations[i]!);
          });
        }
      });

      audioPlayers[i]!.onPlayerComplete.listen((event) async {
        if (mounted) {
          setState(() {
            isPlayingList[i] = false;
            stepPositions[i] = Duration.zero;
            stepProgress[i] = 0.0;

            // Увеличиваем кол-во прослушанных шагов
            if (i == listenedStepsCount) {
              listenedStepsCount++;

              // Обновляем состояние в Bloc
              context.read<MeditationBloc>().add(
                UpdateStepCount(
                  id: widget.curElement,
                  stepCount: listenedStepsCount,
                ),
              );
            }

            // Переход на экран завершения
            if (mounted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => EndMeditationScreen(colors: widget.colors),
                ),
              );
            }
          });
        }
      });
    }
  }

  // Функция для расчета прогресса
  double durationToProgress(Duration position, Duration total) {
    return (total.inSeconds > 0) ? position.inSeconds / total.inSeconds : 0.0;
  }

  Future<void> _playPauseMusic(int step) async {
    final player = audioPlayers[step];

    if (player == null) {
      print("Ошибка: Плеер не найден для шага $step");
      return;
    }

    if (isPlayingList[step]) {
      print("Пауза для шага $step");
      await player.pause();
    } else {
      print("Попытка воспроизвести: ${widget.steps![step].stepAsset}");
      try {
        await player.play(AssetSource(widget.steps![step].stepAsset));
        print("Аудио запущено!");
      } catch (e) {
        print("Ошибка при воспроизведении: $e");
      }
    }

    setState(() {
      isPlayingList[step] = !isPlayingList[step];
    });
  }

  @override
  void dispose() {
    for (var player in audioPlayers.values) {
      player.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.colors?[7],
      body: Stack(
        children: [
          Positioned(
            left: 0,
            child: Image.asset('assets/img/lvec.png', color: widget.colors![8]),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/img/rvec.png', color: widget.colors![8]),
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
                              value: stepProgress[index] ?? 0.0,
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
                                isPlayingList[index]
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
