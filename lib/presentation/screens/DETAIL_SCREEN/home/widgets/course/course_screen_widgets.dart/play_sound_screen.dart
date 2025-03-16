import 'package:flutter/material.dart';

class PlaySoundScreen extends StatefulWidget {
  final AnimationController animationController;
  final bool isPaused;
  final List<Color> colors;
  const PlaySoundScreen({
    super.key,
    required this.animationController,
    required this.isPaused,
    required this.colors,
  });

  @override
  State<PlaySoundScreen> createState() => _PlaySoundScreenState();
}

class _PlaySoundScreenState extends State<PlaySoundScreen> {
  late bool _isPaused;

  @override
  void initState() {
    super.initState();
    _isPaused = widget.isPaused;
  }

  void _togglePause() {
    setState(() {
      if (_isPaused) {
        widget.animationController.forward();
      } else {
        widget.animationController.stop();
      }
      _isPaused = !_isPaused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          child: Image.asset('asset/img/lvec.png', color: widget.colors[8]),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset('asset/img/rvec.png', color: widget.colors[8]),
        ),
        // Индикатор загрузки
        Align(
          alignment: Alignment.center,
          child: AnimatedBuilder(
            animation: widget.animationController,
            builder: (context, child) {
              return SizedBox(
                height: 155,
                width: 155,
                child: CircularProgressIndicator(
                  backgroundColor: widget.colors[1],
                  color: widget.colors[2],
                  value: widget.animationController.value,
                  strokeWidth: 40,
                ),
              );
            },
          ),
        ),
        // Кнопка паузы/воспроизведения
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: _togglePause,
            behavior: HitTestBehavior.translucent,
            child: Material(
              color: Colors.transparent,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: widget.colors[2],
                child: Icon(
                  _isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
