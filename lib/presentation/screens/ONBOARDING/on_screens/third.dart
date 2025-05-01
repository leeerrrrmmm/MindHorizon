import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Third extends StatefulWidget {
  final PageController pageController;

  const Third({super.key, required this.pageController});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  Timer? _timer;
  Duration _elapsedTime = Duration.zero;
  bool _isRunning = false;

  void startTimer() {
    if (_isRunning) return;
    setState(() {
      _isRunning = true;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime += Duration(seconds: 1);
      });
    });
  }

  void stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      setState(() {
        _isRunning = false;
      });
    }
  }

  String formatTime(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffbe7c3),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            child: Image.asset('assets/img/flowers.png', color: Colors.white),
          ),
          Positioned(
            top: 120.h,
            left: 0.w,
            right: 0.w,
            child: Center(
              child: Text(
                _isRunning
                    ? "Inhale..."
                    : (_elapsedTime.inSeconds > 0
                        ? "Well Done!\n You inhale lasted ${_elapsedTime.inSeconds} seconds"
                        : "Let's measure your inhale"),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.sp,
                  color: Color(0xfff19584),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          if (!(_timer?.isActive ?? false) && _elapsedTime.inSeconds > 0)
            Positioned(top: 180.h, child: Image.asset('assets/gif/done.gif')),
          Positioned(
            top: 240.h,
            left: 0.w,
            right: 0.w,
            bottom: 240.h,
            child: Image.asset('assets/gif/cloud.gif', color: Colors.white),
          ),
          if (_elapsedTime.inSeconds >= 0)
            Positioned(
              top: MediaQuery.of(context).size.height / 2,
              left: 0.w,
              right: 0.w,
              child: Center(
                child: Text(
                  formatTime(_elapsedTime),
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfffea386),
                  ),
                ),
              ),
            ),
          Positioned(
            left: 0.w,
            right: 0.w,

            bottom: 120.h,
            child: Text(
              _isRunning
                  ? "Press 'Stop'\nwhen you reach your limit"
                  : _elapsedTime.inSeconds > 0
                  ? ''
                  : "Press 'Start'\nwhen you're ready ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: Color(0xfff19584),
              ),
            ),
          ),
          //BUTTON
          Positioned(
            bottom: 30.h,
            right: 0.w,
            left: 0.w,
            child: GestureDetector(
              onTap: () {
                if (_isRunning) {
                  stopTimer();
                } else if (_elapsedTime.inSeconds > 0) {
                  widget.pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  startTimer();
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: Container(
                  height: 66.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      _isRunning
                          ? 'Stop'
                          : (_elapsedTime.inSeconds > 0
                              ? 'Great! Move forward'
                              : 'Start'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        color: Color(0xfffea386),
                      ),
                    ),
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
