import 'package:flutter/material.dart';
import 'package:mind_horizon/data/models/steps_model.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/widgets/end_meditation_screen.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/widgets/play_meditaion_screen.dart';

class MeditationDetailScreen extends StatefulWidget {
  final List<StepsModel>? steps;
  final List<Color>? colors;
  final int secItemId;
  final int stepCounter;
  final int curListenedEl;

  const MeditationDetailScreen({
    super.key,
    required this.steps,
    required this.colors,
    required this.secItemId,
    required this.stepCounter,
    required this.curListenedEl,
  });

  @override
  State<MeditationDetailScreen> createState() => _MeditationDetailScreenState();
}

class _MeditationDetailScreenState extends State<MeditationDetailScreen>
    with TickerProviderStateMixin {
  late List<AnimationController> _animationControllers;
  bool _isPaused = false;
  bool _isEnded = false;

  @override
  void initState() {
    super.initState();
    // Создаем контроллеры для каждого шага
    _animationControllers = List.generate(
      widget.steps!.length,
      (index) =>
          AnimationController(vsync: this, duration: const Duration(seconds: 2))
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                setState(() {
                  _isEnded = true;
                  _isPaused = true;
                  // Обновляем количество шагов в состоянии
                });
              }
            }),
    );
  }

  @override
  void dispose() {
    // Освобождаем ресурсы контроллеров
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.colors?[7],
      body:
          _isEnded
              ? EndMeditationScreen(colors: widget.colors)
              : PlayMeditationScreen(
                steps: widget.steps,
                colors: widget.colors,
                animationController: _animationControllers,
                isPaused: _isPaused,
                currentStep: widget.curListenedEl,
                curElement: widget.secItemId,
              ),
    );
  }
}
