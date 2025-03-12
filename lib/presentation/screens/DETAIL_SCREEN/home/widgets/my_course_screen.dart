import 'package:flutter/material.dart';

class MyCourseScreen extends StatelessWidget {
  final String title;
  final int secondIndex;
  final String secondTitle;
  const MyCourseScreen({
    super.key,
    required this.title,
    required this.secondIndex,
    required this.secondTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(fontSize: 40)),
            Text('$secondTitle: $secondIndex', style: TextStyle(fontSize: 40)),
          ],
        ),
      ),
    );
  }
}
