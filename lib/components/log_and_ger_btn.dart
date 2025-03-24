import 'package:flutter/material.dart';
import 'package:mind_horizon/presentation/screens/REGISTER/widgets/build_reg_text.dart';

class LogAndGerBtn extends StatelessWidget {
  final String textBtn;
  final void Function()? onTap;
  const LogAndGerBtn({super.key, required this.textBtn, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffe7c178),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: BuildRegText(
            text: textBtn,
            fontSize: 32,
            fontWeight: FontWeight.w500,
            fontFamily: 'AlegreyaSans',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
