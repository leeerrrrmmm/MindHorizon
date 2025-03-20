import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_horizon/data/models/steps_model.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_bloc.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_event.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/widgets/end_meditation_screen.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/widgets/play_meditaion_screen.dart';

class MeditationDetailScreen extends StatefulWidget {
  final List<StepsModel>? steps;
  final List<Color>? colors;
  final int secItemId;

  const MeditationDetailScreen({
    super.key,
    required this.steps,
    required this.colors,
    required this.secItemId,
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
                  context.read<ButtonBloc>().add(IncrementButtonEvent());
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
              : PlayMeditaionScreen(
                animationControllers:
                    _animationControllers, // Передаем контроллеры
                isPaused: _isPaused,
                colors: widget.colors!,
                steps: widget.steps!,
              ),
    );
  }
}
