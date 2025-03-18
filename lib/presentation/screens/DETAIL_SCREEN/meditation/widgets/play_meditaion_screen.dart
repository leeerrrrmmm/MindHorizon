import 'package:flutter/material.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/data/models/steps_model.dart';

class PlayMeditaionScreen extends StatefulWidget {
  final AnimationController animationController;
  final bool isPaused;
  final List<Color> colors;
  final List<StepsModel>? steps;

  const PlayMeditaionScreen({
    super.key,
    required this.animationController,
    required this.isPaused,
    required this.colors,
    required this.steps,
  });

  @override
  State<PlayMeditaionScreen> createState() => _PlayMeditaionScreenState();
}

class _PlayMeditaionScreenState extends State<PlayMeditaionScreen> {
  int _curPage = 0;
  late bool _isPaused;
  final PageController _pageController = PageController();
  late List<bool> _isUnlocked;

  @override
  void initState() {
    super.initState();
    _isPaused = widget.isPaused;
    _isUnlocked = List.generate(widget.steps!.length, (index) => index == 0);
  }

  @override
  void dispose() {
    super.dispose();
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
        PageView.builder(
          scrollDirection: Axis.vertical,
          controller: _pageController,
          itemCount: widget.steps!.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Верхняя кнопка
                  _curPage == 0
                      ? const SizedBox()
                      : GestureDetector(
                        onTap: () {
                          setState(() {
                            _curPage--;
                            _pageController.previousPage(
                              duration: Duration(milliseconds: 600),
                              curve: Curves.easeIn,
                            );
                          });
                        },
                        child: Image.asset(
                          'asset/img/topArrow.png',
                          color: widget.colors[2],
                        ),
                      ),
                  const SizedBox(height: 40),
                  Column(
                    children: [
                      BuildText(
                        text: widget.steps![index].title,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: widget.colors[9],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 155,
                              width: 155,
                              child: AnimatedBuilder(
                                animation: widget.animationController,
                                builder: (context, child) {
                                  return CircularProgressIndicator(
                                    backgroundColor: widget.colors[1],
                                    color: widget.colors[2],
                                    value:
                                        _isUnlocked[index] == false
                                            ? 0
                                            : widget.animationController.value,
                                    strokeWidth: 40,
                                  );
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: _isUnlocked[index] ? _togglePause : null,
                              behavior: HitTestBehavior.translucent,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundColor: widget.colors[2],
                                child: Icon(
                                  _isUnlocked[index]
                                      ? (_isPaused
                                          ? Icons.play_arrow_rounded
                                          : Icons.pause_rounded)
                                      : Icons.lock,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Нижняя кнопка
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _curPage++;
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 600),
                          curve: Curves.easeIn,
                        );
                      });
                    },
                    child: Image.asset(
                      'asset/img/bottomArow.png',
                      color: widget.colors[2],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
