import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/data/models/steps_model.dart';
import 'package:mind_horizon/testt/a.dart';

class PlayMeditationScreen extends StatefulWidget {
  final List<StepsModel>? steps;
  final List<Color>? colors;
  final List<AnimationController> animationController;
  final bool isPaused;
  final int currentStep;
  final int curElement;

  const PlayMeditationScreen({
    super.key,
    required this.steps,
    required this.colors,
    required this.animationController,
    required this.isPaused,
    required this.currentStep,
    required this.curElement,
  });

  @override
  State<PlayMeditationScreen> createState() => _PlayMeditationScreenState();
}

class _PlayMeditationScreenState extends State<PlayMeditationScreen> {
  late int stepCount;
  late int listenedStepsCount;
  late bool isPaused;

  @override
  void initState() {
    super.initState();
    stepCount = widget.currentStep;
    listenedStepsCount = widget.currentStep;
    isPaused = !widget.isPaused;
  }

  // Функция для обработки старта и паузы анимации
  void toggleAnimation(int step) {
    setState(() {
      if (isPaused) {
        widget.animationController[step].forward();
      } else {
        widget.animationController[step].stop();
      }
      isPaused = !isPaused;
    });

    widget.animationController[step].addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Проверяем, что прослушивается последний открытый шаг
        if (step == listenedStepsCount) {
          setState(() {
            listenedStepsCount++;
          });

          context.read<MeditationBloc>().add(
            UpdateStepCount(
              id: widget.curElement,
              stepCount: listenedStepsCount,
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount:
                listenedStepsCount < widget.steps!.length
                    ? listenedStepsCount + 1
                    : listenedStepsCount,
            onPageChanged: (page) {
              setState(() {
                stepCount = page;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
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
                                child: AnimatedBuilder(
                                  animation: widget.animationController[index],
                                  builder: (context, child) {
                                    return CircularProgressIndicator(
                                      backgroundColor: widget.colors?[1],
                                      color: widget.colors?[2],
                                      value:
                                          widget
                                              .animationController[index]
                                              .value,
                                      strokeWidth: 40,
                                    );
                                  },
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  toggleAnimation(
                                    index,
                                  ); // Старт или пауза анимации
                                },
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundColor: widget.colors?[2],
                                  child: Icon(
                                    isPaused
                                        ? Icons.play_arrow_rounded
                                        : Icons.pause_rounded,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
