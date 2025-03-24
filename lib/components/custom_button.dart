import 'package:flutter/material.dart';
import 'package:mind_horizon/presentation/screens/REGISTER/widgets/build_reg_text.dart';

class CustomButton extends StatelessWidget {
  final String textBtn;
  final void Function()? onTap;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final double height;
  final String? fontFamily;
  const CustomButton({
    super.key,
    required this.textBtn,
    required this.onTap,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    required this.height,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: BuildRegText(
            text: textBtn,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily ?? '',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
