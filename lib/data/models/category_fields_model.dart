import 'package:mind_horizon/data/models/steps_model.dart';

class CategoryFields {
  final int id;
  final String title;
  final String description;
  final String imagePath;
  final List<StepsModel> steps;

  CategoryFields({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.steps,
  });
}
