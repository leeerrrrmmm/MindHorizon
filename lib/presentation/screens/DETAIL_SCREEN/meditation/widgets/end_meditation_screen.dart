import 'package:flutter/material.dart';
import 'package:mind_horizon/components/build_text.dart';

class EndMeditationScreen extends StatelessWidget {
  final List<Color>? colors;
  const EndMeditationScreen({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            child: Image.asset('asset/img/lvec.png', color: colors?[8]),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('asset/img/rvec.png', color: colors?[8]),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: colors?[2],
              ),
              height: 746,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: 80,
                    left: 0,
                    child: Image.asset('asset/img/lvec.png', color: colors?[7]),
                  ),
                  Positioned(
                    bottom: -40,
                    right: 0,
                    child: Image.asset(
                      'asset/img/rbvec.png',
                      color: colors?[7],
                    ),
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: BuildText(
                              text: 'Very good!',
                              fontSize: 36,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20.0,
                              bottom: 120.0,
                            ),
                            child: BuildText(
                              text: 'Deep immersion in meditation',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Container(
                          width: double.infinity,
                          height: 386,
                          decoration: BoxDecoration(
                            color: colors?[7],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: Text(
                                textAlign: TextAlign.center,
                                'While you focus on something pleasant, the flow of thoughts slows down, you relax faster, throw away all worries, concerns and thoughts about the passing day.',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: colors?[2],
                                ),
                              ),
                            ),
                          ),
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
    );
  }
}
