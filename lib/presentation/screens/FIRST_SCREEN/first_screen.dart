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
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 0.5.sh, // половина высоты экрана
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xfffbe7c3),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(250.r),
                bottomRight: Radius.circular(250.r),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 100.h,
                  right: -60.w,
                  child: Transform.rotate(
                    angle: -16.3 * (math.pi / 160),
                    child: Image.asset('assets/gif/der.gif', scale: 1.0),
                  ),
                ),
              ],
            ),
          ),
          34.hBox,
          BuildText(
            text: 'MindHorizon',
            fontSize: 33.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 60.h,
            width: 280.w,
            child: Text(
              textAlign: TextAlign.center,
              'Relieve stress, sleep better, and find true happiness',
              style: TextStyle(
                fontSize: 18.sp,
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
                  color: const Color(0xfffea386),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Poppins',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Onboarding()),
                  );
                },
                child: Text(
                  ' LogIn',
                  style: TextStyle(
                    color: const Color(0xfffea386),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
          90.hBox,

          /// КНОПКА
          GestureDetector(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Onboarding()),
                ),
            child: Container(
              width: 216.w,
              height: 63.h,
              decoration: BoxDecoration(
                color: const Color(0xfffbe7c3),
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: const Color(0xfffea386),
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
