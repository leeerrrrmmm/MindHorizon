import 'package:flutter/material.dart';
import 'package:mind_horizon/presentation/screens/ONBOARDING/on_screens/first.dart';
import 'package:mind_horizon/presentation/screens/ONBOARDING/on_screens/fourth.dart';
import 'package:mind_horizon/presentation/screens/ONBOARDING/on_screens/second.dart';
import 'package:mind_horizon/presentation/screens/ONBOARDING/on_screens/third.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int selectIndex = 0;
  final _controller = PageController();
  bool isItemSelected = false;

  void onItemSelected(bool selected) {
    setState(() {
      isItemSelected = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: <Widget>[
            PageView(
              controller: _controller,
              onPageChanged: (val) {
                setState(() {
                  selectIndex = val;
                  isItemSelected = false;
                });
              },
              children: [
                First(onItemSelected: onItemSelected),
                Second(onItemSelected: onItemSelected),
                Third(pageController: _controller),
                Fourth(),
              ],
            ),
            Positioned(
              top: 60,
              left: 14,
              child: IconButton(
                onPressed: () {
                  selectIndex == 0
                      ? null
                      : _controller.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                },
                icon: Icon(Icons.arrow_back_ios_new, color: Color(0xfff19584)),
              ),
            ),
            if (selectIndex < 2 && isItemSelected)
              Positioned(
                bottom: 44,
                left: MediaQuery.of(context).size.width / 2 - 108,
                child: GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Container(
                    width: 216,
                    height: 63,
                    decoration: BoxDecoration(
                      color: Color(0xfffbe7c3),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        selectIndex == 0 ? "Set a goal" : "Continue",
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
            Positioned(
              top: 78,
              left: 76,
              child: Container(
                width: 290,
                height: 8,
                decoration: BoxDecoration(
                  color: Color(0xfffcd1af),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: (selectIndex / 4) * 290,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Color(0xfff19584),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
