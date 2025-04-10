import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/presentation/extension/size_extension.dart';
import 'package:mind_horizon/presentation/screens/ONBOARDING/onboarding.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height:
                MediaQuery.of(context).size.height < 896
                    ? screenHeight / 2.1
                    /// Тест для СЕ
                    : MediaQuery.of(context).size.height > 896
                    ? screenHeight /
                        2 // 16 pro max
                    : screenHeight / 2, // 11 iphone36,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xfffbe7c3),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(250),
                bottomRight: Radius.circular(250),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top:
                      MediaQuery.of(context).size.height < 896
                          ? 40
                          /// Тест для СЕ
                          : MediaQuery.of(context).size.height > 896
                          ? 130 // 16 pro max
                          : 130, // 11 iphone 130,
                  right: -60,
                  child: Transform.rotate(
                    angle: -16.3 * (math.pi / 160),
                    child: Image.asset(
                      'assets/gif/der.gif',
                      scale:
                          MediaQuery.of(context).size.height < 896
                              ? 1.3
                              /// Тест для СЕ
                              : MediaQuery.of(context).size.height > 896
                              ? 1 // 16 pro max
                              : 1, // 11 iphone
                    ),
                  ),
                ),
              ],
            ),
          ),
          34.hBox,
          BuildText(
            text: 'MindHorizon',
            fontSize:
                MediaQuery.of(context).size.height < 896
                    ? 28.sp
                    /// Тест для СЕ
                    : MediaQuery.of(context).size.height > 896
                    ? 35
                        .sp // 16 pro max
                    : 33.sp, // 11 iphone 35,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 60,
            width: 280,
            child: Text(
              textAlign: TextAlign.center,
              'Relieve stress, sleep better, and find true happiness',
              style: TextStyle(
                fontSize:
                    MediaQuery.of(context).size.height < 896
                        ? 17.sp
                        /// Тест для СЕ
                        : MediaQuery.of(context).size.height > 896
                        ? 18
                            .sp // 16 pro max
                        : 18.sp, // 11 iphone20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          100.hBox,

          /// ЕСЛИ ЗАРЕГИСТРИРОВАН -> страница логина
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: TextStyle(
                  color: Color(0xfffea386),
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Poppins',
                ),
              ),
              GestureDetector(
                onTap: () {
                  // НАВИГАЦИЯ НА СТРАНИЦУ ЛОГИНА
                },
                child: Text(
                  'LogIn',
                  style: TextStyle(
                    color: Color(0xfffea386),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
          MediaQuery.of(context).size.height < 896
              ? 25.h.hBox
              /// Тест для СЕ
              : MediaQuery.of(context).size.height > 896
              ? 100.h.hBox
              // 16 pro max
              : 90.h.hBox, // 11 iphone20,
          /// КНОПКА
          GestureDetector(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Onboarding()),
                ),
            child: Container(
              width: 216,
              height: 63,
              decoration: BoxDecoration(
                color: Color(0xfffbe7c3),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Color(0xfffea386),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
