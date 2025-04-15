import 'package:flutter/material.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/widgets/play_solo_meditation_screen.dart';

class LongMeditationScreen extends StatefulWidget {
  final String? longStepAsset;
  final List<Color>? colors;
  final String title;

  const LongMeditationScreen({
    super.key,
    required this.colors,
    required this.longStepAsset,
    required this.title,
  });

  @override
  State<LongMeditationScreen> createState() => _LongMeditationScreenState();
}

class _LongMeditationScreenState extends State<LongMeditationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.colors?[7],
      body: PlaySoloMeditationScreen(
        colors: widget.colors,
        lonStepAsset: widget.longStepAsset ?? '',
        title: widget.title,
      ),
    );
  }
}
