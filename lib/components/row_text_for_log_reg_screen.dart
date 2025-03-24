import 'package:flutter/material.dart';
import 'package:mind_horizon/presentation/screens/REGISTER/widgets/build_reg_text.dart';

class UnderButtonText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final void Function()? onTap;

  const UnderButtonText({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        BuildRegText(
          text: firstText,
          fontSize: 22,
          fontWeight: FontWeight.w400,
          fontFamily: 'AlegreyaSans',
          color: Color(0xff5b6c72),
        ),
        GestureDetector(
          onTap: onTap,
          child: BuildRegText(
            text: '\t$secondText',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'AlegreyaSans',
            color: Color(0xff5b6c72),
          ),
        ),
      ],
    );
  }
}
