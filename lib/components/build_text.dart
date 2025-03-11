import 'package:flutter/material.dart';

class BuildText extends StatelessWidget {
  const BuildText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.color,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
