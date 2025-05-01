import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:mind_horizon/presentation/screens/REGISTER/register_screen.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({super.key});

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  double _progress = 0.0;
  String _buttonText = 'Analyzing data...';
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      if (_progress < 1.0) {
        setState(() {
          _progress += 0.1;
          _isRunning = true;
        });
      } else {
        timer.cancel();
        setState(() {
          _buttonText = 'Absolutely!';
          _isRunning = false;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => RegisterScreen()),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height.h / 1.2.h,
            decoration: BoxDecoration(
              color: Color(0xfffbe7c3),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(250),
                bottomRight: Radius.circular(250),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'MindHorizon',
                    style: TextStyle(
                      fontSize: 33.sp,
                      color: Color(0xfffea386),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Image.asset('assets/gif/flower.gif'),
                Text(
                  textAlign: TextAlign.center,
                  !_isRunning && _progress > 0.0
                      ? "Your plan is ready.\nLet's begin?"
                      : 'Creating your\npersonalized plan',
                  style: TextStyle(
                    fontSize: 19.sp,
                    color: Color(0xfffea386),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30.0),
            width: 330.w,
            height: 63.h,
            decoration: BoxDecoration(
              color: Color(0xfffcd1af),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  width: 330.w * _progress,
                  height: 63.h,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Center(
                  child: Text(
                    _buttonText,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
