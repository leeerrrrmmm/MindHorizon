import 'package:flutter/material.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/home/widgets/course/course_screen_widgets.dart/end_playing_sound_on_screen.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/home/widgets/course/course_screen_widgets.dart/play_sound_screen.dart';

class MyCourseScreen extends StatefulWidget {
  final String title;
  final int secondIndex;
  final String secondTitle;
  final List<Color> colors;

  const MyCourseScreen({
    super.key,
    required this.title,
    required this.secondIndex,
    required this.secondTitle,
    required this.colors,
  });

  @override
  State<MyCourseScreen> createState() => _MyCourseScreenState();
}

class _MyCourseScreenState extends State<MyCourseScreen>
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
      backgroundColor: widget.colors[7],
      body:
          _isEnded == true
              ? EndPlayingSoundOnScreen(colors: widget.colors)
              : PlaySoundScreen(
                animationController: _animationController,
                isPaused: _isPaused,
                colors: widget.colors,
              ),
    );
  }
}
