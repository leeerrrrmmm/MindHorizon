import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/data/models/steps_model.dart';
import 'package:mind_horizon/testt/a.dart';

class PlayMeditationScreen extends StatefulWidget {
  final List<StepsModel>? steps;
  final List<Color>? colors;
  final List<AnimationController> animationController;
  late bool isPaused;
  final int currentStep; // Текущий шаг
  final int curElement;

  PlayMeditationScreen({
    super.key,
    required this.steps,
    required this.colors,
    required this.animationController,
    required this.isPaused,
    required this.currentStep, // Инициализация текущего шага
    required this.curElement,
  });

  @override
  State<PlayMeditationScreen> createState() => _PlayMeditationScreenState();
}

class _PlayMeditationScreenState extends State<PlayMeditationScreen> {
  late int stepCount; // Локальный счетчик шагов
  late int listenedStepsCount; // Количество прослушанных шагов

  @override
  void initState() {
    super.initState();
    stepCount = widget.currentStep;
    listenedStepsCount = widget.currentStep; // Инициализируем с текущего шага
  }

  // Функция для обработки старта и паузы анимации
  void toggleAnimation(int step) {
    setState(() {
      if (widget.isPaused) {
        widget.animationController[step]
            .forward(); // Запуск анимации для конкретного шага
      } else {
        widget.animationController[step]
            .stop(); // Остановка анимации для текущего шага
      }
      widget.isPaused = !widget.isPaused; // Переключение состояния паузы
    });

    // После завершения анимации обновляем состояние
    widget.animationController[step].addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.read<MeditationBloc>().add(
          UpdateStepCount(
            id: widget.curElement,
            stepCount: listenedStepsCount + 1,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.colors?[7],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Прослушано шагов: $listenedStepsCount / ${widget.steps?.length}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listenedStepsCount + 1,
              onPageChanged: (page) {
                setState(() {
                  stepCount = page; // Обновление текущего шага
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Step: ${index + 1} / ${widget.steps?.length}',
                      style: TextStyle(fontSize: 20),
                    ),
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
                                    animation:
                                        widget.animationController[index],
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
                                      widget.isPaused
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
          ),
        ],
      ),
    );
  }
}
