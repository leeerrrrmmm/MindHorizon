import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          fontSize:
              MediaQuery.of(context).size.height < 896
                  ? 18.sp
                  /// Тест для СЕ
                  : MediaQuery.of(context).size.height > 896
                  ? 22.sp
                  // 16 pro max
                  : 22.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'AlegreyaSans',
          color: Color(0xff5b6c72),
        ),
        GestureDetector(
          onTap: onTap,
          child: BuildRegText(
            text: '\t$secondText',
            fontSize:
                MediaQuery.of(context).size.height < 896
                    ? 18.sp
                    /// Тест для СЕ
                    : MediaQuery.of(context).size.height > 896
                    ? 22.sp
                    // 16 pro max
                    : 22.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'AlegreyaSans',
            color: Color(0xff5b6c72),
          ),
        ),
      ],
    );
  }
}
