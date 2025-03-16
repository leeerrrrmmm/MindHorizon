import 'package:flutter/material.dart';
import 'package:mind_horizon/data/models/category_fields_model.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/home/widgets/asmr_screen.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/home/widgets/course/my_course_screen.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/home/widgets/sound_of_the_day.dart';

class DetailHomeScreen extends StatelessWidget {
  final int index;
  final int secondIndex;
  final String title;
  final CategoryFields secondeItems;
  final String? imagePath;
  final List<Color>? colors;
  const DetailHomeScreen({
    super.key,
    required this.index,
    required this.title,
    required this.secondIndex,
    required this.secondeItems,
    required this.colors,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          index == 0
              ? MyCourseScreen(
                title: title,
                secondIndex: secondIndex,
                secondTitle: secondeItems.title,
                colors: [...?colors],
              )
              : index == 1
              ? AsmrScreen(imagePath: imagePath ?? '')
              : SoundOfTheDay(
                title: secondeItems.title,
                description: secondeItems.description,
              ),
    );
  }
}
