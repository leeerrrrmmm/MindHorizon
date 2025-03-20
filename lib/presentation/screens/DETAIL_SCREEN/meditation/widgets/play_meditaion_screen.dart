import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/data/models/steps_model.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_bloc.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_state.dart';

class PlayMeditaionScreen extends StatefulWidget {
  final List<AnimationController> animationControllers; // Список контроллеров
  final bool isPaused;
  final List<Color> colors;
  final List<StepsModel>? steps;

  const PlayMeditaionScreen({
    super.key,
    required this.animationControllers,
    required this.isPaused,
    required this.colors,
    required this.steps,
  });

  @override
  State<PlayMeditaionScreen> createState() => _PlayMeditaionScreenState();
}

class _PlayMeditaionScreenState extends State<PlayMeditaionScreen> {
  int _curPage = 0;
  final PageController _pageController = PageController();
  late List<bool> _isUnlocked;
  late List<bool> _isPlaying;

  @override
  void initState() {
    super.initState();
    widget.isPaused;
    _isUnlocked = List.generate(
      widget.steps!.length,
      (index) => index <= widget.steps!.length,
    );
    _isPlaying = List.generate(
      widget.steps!.length,
      (index) => false,
    ); // Изначально все элементы не проигрываются
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _togglePause(int index) {
    setState(() {
      if (_isPlaying[index]) {
        widget.animationControllers[index].stop();
      } else {
        widget.animationControllers[index].forward();
      }
      _isPlaying[index] = !_isPlaying[index];
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
        BlocBuilder<ButtonBloc, ButtonState>(
          builder: (context, state) {
            return PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              itemCount: widget.steps!.length,
              itemBuilder: (context, index) {
                bool isButtonActive = index <= state.unlockedButtons;

                return isButtonActive
                    ? SizedBox(
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
                                        animation:
                                            widget.animationControllers[index],
                                        builder: (context, child) {
                                          return CircularProgressIndicator(
                                            backgroundColor: widget.colors[1],
                                            color: widget.colors[2],
                                            value:
                                                _isUnlocked[index] == false
                                                    ? 0
                                                    : widget
                                                        .animationControllers[index]
                                                        .value,
                                            strokeWidth: 40,
                                          );
                                        },
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap:
                                          _isUnlocked[index]
                                              ? () {
                                                setState(() {
                                                  for (
                                                    int i = 0;
                                                    i < _isPlaying.length;
                                                    i++
                                                  ) {
                                                    if (i != index) {
                                                      _isPlaying[i] = false;
                                                    }
                                                  }
                                                  _togglePause(
                                                    index,
                                                  ); // Запуск/пауза для текущего шага
                                                });
                                              }
                                              : null,
                                      behavior: HitTestBehavior.translucent,
                                      child: CircleAvatar(
                                        radius: 60,
                                        backgroundColor: widget.colors[2],
                                        child: Icon(
                                          _isUnlocked[index]
                                              ? (_isPlaying[index]
                                                  ? Icons.pause_rounded
                                                  : Icons.play_arrow_rounded)
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
                    )
                    : null;
              },
            );
          },
        ),
      ],
    );
  }
}
