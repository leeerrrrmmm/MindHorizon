import 'package:flutter/material.dart';

class BuildRegText extends StatelessWidget {
  const BuildRegText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.fontFamily,
    this.color,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
