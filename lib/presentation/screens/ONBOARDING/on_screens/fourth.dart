import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_horizon/presentation/screens/ONBOARDING/analizyng_screen.dart';

class Fourth extends StatefulWidget {
  const Fourth({super.key});

  @override
  State<Fourth> createState() => _FourthState();
}

class _FourthState extends State<Fourth> {
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
            top: -10,
            left: 0,
            child: Image.asset('assets/img/flowers.png', color: Colors.white),
          ),
          Positioned(
            top: 105,
            left: 30,
            right: 0,
            child: Center(
              child: Text(
                _isRunning
                    ? "Hold your breath..."
                    : (_elapsedTime.inSeconds > 0
                        ? "Your breath hold lastet ${_elapsedTime.inSeconds} seconds"
                        : "Now let's measure your\n breath hold"),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xfff19584),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          if (!(_timer?.isActive ?? false) && _elapsedTime.inSeconds > 0)
            Positioned(top: 230, child: Image.asset('assets/gif/done.gif')),
          Positioned(
            top: 270,
            left: -30,
            child: Image.asset('assets/gif/cloud.gif', color: Colors.white),
          ),
          if (_elapsedTime.inSeconds >= 0)
            Positioned(
              top: MediaQuery.of(context).size.height / 2,
              left: MediaQuery.of(context).size.width / 2 - 50,
              child: Center(
                child: Text(
                  formatTime(_elapsedTime),
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfffea386),
                  ),
                ),
              ),
            ),
          // ТЕКСТ НАД КНОПКОЙ
          Positioned(
            left:
                _isRunning
                    ? MediaQuery.of(context).size.width / 3.2
                    : MediaQuery.of(context).size.width / 2.8,
            top: MediaQuery.of(context).size.height / 1.22,
            child: Text(
              _isRunning
                  ? "Press 'Stop'\nwhen you reach your limit"
                  : _elapsedTime.inSeconds > 0
                  ? ''
                  : "Press 'Start'\nwhen you're ready ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Color(0xfff19584),
              ),
            ),
          ),
          // КНОПКА
          Positioned(
            bottom: 44,
            right: 113,
            child: GestureDetector(
              onTap: () {
                if (_isRunning) {
                  stopTimer();
                } else if (_elapsedTime.inSeconds > 0) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(builder: (context) => CheckScreen()),
                    (route) => false,
                  );
                } else {
                  startTimer();
                }
              },
              child: Container(
                width: 216,
                height: 66,
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
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: Color(0xfffea386),
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
