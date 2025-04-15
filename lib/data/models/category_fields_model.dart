import 'dart:ui';

import 'package:mind_horizon/data/models/sounds_model.dart';
import 'package:mind_horizon/data/models/steps_model.dart';

class CategoryFields {
  final int id;
  final String title;
  final String description;
  final String imagePath;
  final String? largestImagepath;
  final List<StepsModel>? steps;
  final List<SoundsModel>? sounds;
  final String? videoPath;
  List<Color>? colors;
  late int? curStepListened;
  final String? longStepAsset;

  CategoryFields({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    this.videoPath,
    this.steps,
    this.sounds,
    this.colors,
    this.longStepAsset,
    this.largestImagepath,
    int? curStepListened,
  }) : curStepListened = curStepListened ?? 0;
}
