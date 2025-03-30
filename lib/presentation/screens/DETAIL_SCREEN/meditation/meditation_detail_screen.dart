import 'package:flutter/material.dart';
import 'package:mind_horizon/data/models/steps_model.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/widgets/play_meditaion_screen.dart';

class MeditationDetailScreen extends StatefulWidget {
  final List<StepsModel>? steps;
  final List<Color>? colors;
  final int secItemId;
  final int stepCounter;
  final int curListenedEl;
  final String curStepMusic;

  const MeditationDetailScreen({
    super.key,
    required this.steps,
    required this.colors,
    required this.secItemId,
    required this.stepCounter,
    required this.curListenedEl,
    required this.curStepMusic,
  });

  @override
  State<MeditationDetailScreen> createState() => _MeditationDetailScreenState();
}

class _MeditationDetailScreenState extends State<MeditationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.colors?[7],
      body: PlayMeditationScreen(
        steps: widget.steps,
        colors: widget.colors,
        currentStep: widget.curListenedEl,
        curElement: widget.secItemId,
        stepAsset: widget.curStepMusic,
      ),
    );
  }
}
