import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class First extends StatefulWidget {
  final Function(bool) onItemSelected;
  const First({super.key, required this.onItemSelected});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  int selectedItem = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: true,
        child: Stack(
          children: [
            // Задний фон
            Positioned(
              top: -100,
              right: -80,
              child: Transform(
                alignment: Alignment.topRight,
                transform: Matrix4.identity()..rotateZ(16.3 * (math.pi / 180)),
                child: Container(
                  width: 460,
                  height: MediaQuery.of(context).size.height / 1.1,
                  decoration: BoxDecoration(
                    color: Color(0xfffbe7c3),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(250),
                      bottomRight: Radius.circular(350),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 240.h,

              left: -228.w,
              child: Transform(
                alignment: Alignment.center,
                transform:
                    Matrix4.identity()
                      ..rotateZ(60.3 * (math.pi / 180))
                      ..scale(-1.0, 1.0), // Зеркальное отражение по горизонтали
                child: Image.asset(
                  'assets/gif/der.gif',
                  scale: 1.1.h,
                ), // 11 iphone
              ),
            ),
            // БОКОВОЙ ЕЛЕМЕНТ
            Positioned(
              bottom: -50,
              right: 0,
              child: Image.asset('assets/img/side.png'),
            ),
            // Заголовок
            Positioned(
              top: 96.h,
              left: 0.w,
              right: 0.w,
              child: SizedBox(
                width: 400.w,
                child: Text(
                  textAlign: TextAlign.center,
                  'Why are you here?',
                  style: TextStyle(
                    color: Color(0xfff19584),
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),

            /// ЛИНИИ К ПЕРВОМУ
            Positioned(
              top: 190.h,
              right: 80.w,
              child: Image.asset('assets/img/ovec.png'),
            ),
            Positioned(
              top: 190.h,
              right: 80.w,
              child: Image.asset('assets/img/svec.png'),
            ),
            Positioned(
              top: 190.h,
              right: 80.w,
              child: Image.asset('assets/img/tvec.png'),
            ),
            // Первый выбор
            _buildSelectableCircle(
              0,
              "I want to improve my sleep",

              /// TOP
              200.h,

              //LEFT
              90.w,
            ),

            /// ЛИНИИ КО ВТОРОМУ
            Positioned(
              top: 350.h,
              right: 10.w,
              child: Image.asset('assets/img/ovec.png'),
            ),
            Positioned(
              top: 350.h,
              right: 10.w,
              child: Image.asset('assets/img/svec.png'),
            ),
            Positioned(
              top: 350.h,
              right: 10.w,
              child: Image.asset('assets/img/tvec.png'),
            ),
            // Второй выбор
            _buildSelectableCircle(
              1,
              "I need to relieve stress",
              // TOP
              360.h,
              //RIGHT
              20.w,
            ),

            /// ЛИНИИ К ТРЕТЬЕМУ
            Positioned(
              top: 504.h,
              right: 14.w,
              child: Image.asset('assets/img/ovec.png'),
            ),
            Positioned(
              top: 504.h,
              right: 14.w,
              child: Image.asset('assets/img/svec.png'),
            ),
            Positioned(
              top: 504.h,
              right: 14.w,
              child: Image.asset('assets/img/tvec.png'),
            ),
            // Третий выбор
            _buildSelectableCircle(
              2,
              "I dream of becoming happier",
              //TOP
              510.h,
              //RIGHT
              30.w,
            ),
          ],
        ),
      ),
    );
  }

  // Виджет выбора
  Widget _buildSelectableCircle(
    int index,
    String text,
    double top,
    double right,
  ) {
    bool isSelected = selectedItem == index;

    return Positioned(
      top: top,
      right: right,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedItem = index;
          });
          widget.onItemSelected(
            true,
          ); // Сообщаем родительскому экрану, что элемент выбран
        },
        child: CircleAvatar(
          backgroundColor: isSelected ? Color(0xfffea386) : Color(0xfffcd1af),
          radius: 60.r,
          child: _BuildOnboarding(
            text: text,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? Color(0xfffcd1af) : Color(0xfffea386),
          ),
        ),
      ),
    );
  }
}

class _BuildOnboarding extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const _BuildOnboarding({
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
