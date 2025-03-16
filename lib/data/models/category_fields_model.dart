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
  List<Color>? colors;

  CategoryFields({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    this.steps,
    this.sounds,
    this.colors,
    this.largestImagepath,
  });
}
