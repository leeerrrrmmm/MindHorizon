import 'dart:async';
import 'package:flutter/material.dart';

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
            top:
                MediaQuery.of(context).size.height < 896
                    ? -60
                    /// Тест для СЕ
                    : MediaQuery.of(context).size.height > 896
                    ? -10 // 16 pro max
                    : -10,
            left: 0,
            child: Image.asset(
              'assets/img/flowers.png',
              scale:
                  MediaQuery.of(context).size.height < 896
                      ? 1.2
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 1 // 16 pro max
                      : 1,
              color: Colors.white,
            ),
          ),
          Positioned(
            top:
                MediaQuery.of(context).size.height < 896
                    ? 70
                    /// Тест для СЕ
                    : MediaQuery.of(context).size.height > 896
                    ? 105 // 16 pro max
                    : 105,
            left: 30,
            right: 0,
            child: Center(
              child: Text(
                _isRunning
                    ? "Inhale..."
                    : (_elapsedTime.inSeconds > 0
                        ? "Well Done!\n You inhale lasted ${_elapsedTime.inSeconds} seconds"
                        : "Let's measure your inhale"),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).size.height < 896
                          ? 20
                          /// Тест для СЕ
                          : MediaQuery.of(context).size.height > 896
                          ? 24 // 16 pro max
                          : 24,
                  color: Color(0xfff19584),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          if (!(_timer?.isActive ?? false) && _elapsedTime.inSeconds > 0)
            Positioned(
              top:
                  MediaQuery.of(context).size.height < 896
                      ? 110
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 230 // 16 pro max
                      : 230, // 11 iphone,
              child: Image.asset(
                'assets/gif/done.gif',
                scale:
                    MediaQuery.of(context).size.height < 896
                        ? 1.1
                        /// Тест для СЕ
                        : MediaQuery.of(context).size.height > 896
                        ? 1 // 16 pro max
                        : 1, // 11 iphone
              ),
            ),
          Positioned(
            top:
                MediaQuery.of(context).size.height < 896
                    ? 170
                    /// Тест для СЕ
                    : MediaQuery.of(context).size.height > 896
                    ? 270 // 16 pro max
                    : 250, // 11 iphone
            left:
                MediaQuery.of(context).size.height < 896
                    ? 0
                    /// Тест для СЕ
                    : MediaQuery.of(context).size.height > 896
                    ? -30 // 16 pro max
                    : -30,
            child: Image.asset(
              'assets/gif/cloud.gif',
              scale:
                  MediaQuery.of(context).size.height < 896
                      ? 1.3
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 1 // 16 pro max
                      : 1,
              color: Colors.white,
            ),
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
          Positioned(
            left:
                _isRunning
                    ? MediaQuery.of(context).size.width / 3.2
                    :
                    /// Тест для СЕ
                    MediaQuery.of(context).size.height > 896
                    ? MediaQuery.of(context).size.width /
                        2.8 // 16 pro max
                    : MediaQuery.of(context).size.width / 3.2,
            top:
                MediaQuery.of(context).size.height < 896
                    ? MediaQuery.of(context).size.height / 1.3
                    /// Тест для СЕ
                    : MediaQuery.of(context).size.height > 896
                    ? MediaQuery.of(context).size.height /
                        1.22 // 16 pro max
                    : MediaQuery.of(context).size.height / 1.22,
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
          Positioned(
            bottom:
                MediaQuery.of(context).size.height < 896
                    ? 20
                    /// Тест для СЕ
                    : MediaQuery.of(context).size.height > 896
                    ? 44 // 16 pro max
                    : 44, // 11 iphone
            right:
                MediaQuery.of(context).size.height < 896
                    ? 80
                    /// Тест для СЕ
                    : MediaQuery.of(context).size.height > 896
                    ? 113 // 16 pro max
                    : 113, // 11 iphone
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
                      fontSize:
                          MediaQuery.of(context).size.height < 896
                              ? 22
                              /// Тест для СЕ
                              : MediaQuery.of(context).size.height > 896
                              ? 24 // 16 pro max
                              : 20, // 11 iphone
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
