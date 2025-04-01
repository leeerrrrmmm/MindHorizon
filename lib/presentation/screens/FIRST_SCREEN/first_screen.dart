import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            height: screenHeight / 2,
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
                  top: 130,
                  right: -60,
                  child: Transform.rotate(
                    angle: -16.3 * (math.pi / 160),
                    child: Image.asset('assets/gif/der.gif'),
                  ),
                ),
              ],
            ),
          ),
          34.hBox,
          BuildText(
            text: 'MindHorizon',
            fontSize: 35,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 60,
            width: 314,
            child: BuildText(
              text: 'Relieve stress, sleep better, and find true happiness',
              fontSize: 20,
              fontWeight: FontWeight.w500,
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
          100.hBox,

          /// КНОПКА
          GestureDetector(
            onTap:
                () => Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => Onboarding()),
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
