import 'package:flutter/material.dart';
import 'package:mind_horizon/components/build_text.dart';

class SecondDetailSleepScreen extends StatefulWidget {
  final String categoryTitle;
  final String stepTitle;
  final List<Color>? colors;
  const SecondDetailSleepScreen({
    super.key,
    required this.categoryTitle,
    required this.stepTitle,
    required this.colors,
  });

  @override
  State<SecondDetailSleepScreen> createState() =>
      _SecondDetailSleepScreenState();
}

class _SecondDetailSleepScreenState extends State<SecondDetailSleepScreen> {
  double curSoundPos = 0.0;
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.colors?[10],
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            // BACKGROUND IMG
            Positioned(
              top: 0,
              child: Image.asset(
                'asset/img/flow.png',
                color: widget.colors?[8],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'asset/img/botFlow.png',
                color: widget.colors?[8],
              ),
            ),
            Positioned(
              top: 270,
              right: 50,
              child: Image.asset('asset/img/o.png', color: widget.colors?[9]),
            ),
            Positioned(
              top: 270,
              right: 55,
              child: Image.asset('asset/img/oo.png', color: widget.colors?[9]),
            ),
            Positioned(
              top: 270,
              right: 60,
              child: Image.asset('asset/img/ooo.png', color: widget.colors?[9]),
            ),
            Positioned(
              top: 270,
              right: 60,
              child: Image.asset(
                'asset/img/oooo.png',
                color: widget.colors?[9],
              ),
            ),
            Positioned(
              top: 65.0,
              left: 46.0,
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_left_sharp,
                    size: 40,
                    color: widget.colors?[2],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 80.0,
              left: 150.0,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'MindHorizon',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: widget.colors?[2],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 77.0),
                    child: Column(
                      children: [
                        BuildText(
                          text: widget.categoryTitle,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: widget.colors?[2],
                        ),
                        BuildText(
                          text: widget.stepTitle,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: widget.colors?[9],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 244,
                    height: 244,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.colors?[2],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 50.0,
                          left: 50.0,
                          child: Container(
                            width: 144,
                            height: 144,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      widget.colors?[11] ?? Colors.transparent,
                                  blurRadius: 40,
                                  spreadRadius: 10,
                                ),
                              ],
                              shape: BoxShape.circle,
                              color: widget.colors?[10],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 400,
                      height: 188,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: widget.colors?[1].withValues(alpha: 0.1),
                      ),
                      child: Column(
                        children: [
                          Slider(
                            activeColor: widget.colors?[2],
                            inactiveColor: Color(0xffbdbdbd),
                            min: 0,
                            max: 10.02,
                            value: curSoundPos,
                            onChanged: (val) {
                              setState(() {
                                curSoundPos = val;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(curSoundPos.toStringAsFixed(2)),
                                Text('10:02'),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 35,
                                child: Image.asset(
                                  'asset/img/prev.png',
                                  scale: 0.9,
                                  color: widget.colors?[2],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 11.0,
                                  right: 11.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      clicked = !clicked;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: widget.colors?[2],
                                    radius: 42.5,
                                    child:
                                        !clicked
                                            ? Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8.0,
                                              ),
                                              child: Image.asset(
                                                'asset/img/play.png',
                                                scale: 0.9,
                                              ),
                                            )
                                            : Icon(
                                              Icons.pause,
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 35,
                                child: Image.asset(
                                  'asset/img/next.png',
                                  scale: 0.9,
                                  color: widget.colors?[2],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
