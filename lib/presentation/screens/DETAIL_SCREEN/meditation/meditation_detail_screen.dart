import 'package:flutter/material.dart';
import 'package:mind_horizon/data/models/steps_model.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/widgets/end_meditation_screen.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/widgets/play_meditaion_screen.dart';

class MeditationDetailScreen extends StatefulWidget {
  final List<StepsModel>? steps;
  final List<Color>? colors;

  const MeditationDetailScreen({
    super.key,
    required this.steps,
    required this.colors,
  });

  @override
  State<MeditationDetailScreen> createState() => _MeditationDetailScreenState();
}

class _MeditationDetailScreenState extends State<MeditationDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isPaused = false;
  bool _isEnded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..forward();

    // Добавляем слушатель завершения анимации
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isEnded = true;
          _isPaused = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.colors?[7],
      body:
          _isEnded == true
              ? EndMeditationScreen(colors: widget.colors)
              : PlayMeditaionScreen(
                animationController: _animationController,
                isPaused: _isPaused,
                colors: widget.colors!,
                steps: widget.steps,
              ),
    );
  }
}
