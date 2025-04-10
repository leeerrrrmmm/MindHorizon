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
              top:
                  MediaQuery.of(context).size.height < 896
                      ? 140
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 270
                      // 16 pro max
                      : 270, // 11 iphone20,270,
              left:
                  MediaQuery.of(context).size.height < 896
                      ? -170
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? -239 // 16 pro max
                      : -239, // 11 iphone20, -239,
              child: Transform(
                alignment: Alignment.center,
                transform:
                    Matrix4.identity()
                      ..rotateZ(60.3 * (math.pi / 180))
                      ..scale(-1.0, 1.0), // Зеркальное отражение по горизонтали
                child: Image.asset(
                  'assets/gif/der.gif',
                  scale:
                      MediaQuery.of(context).size.height < 896
                          ? 1.4
                          /// Тест для СЕ
                          : MediaQuery.of(context).size.height > 896
                          ? 1 // 16 pro max
                          : 1,
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
              top:
                  MediaQuery.of(context).size.height < 896
                      ? 60.h
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 105
                          .h // 16 pro max
                      : 100.h, // 11 iphone20, 105,
              left:
                  MediaQuery.of(context).size.height < 896
                      ? 10.w
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 14.w
                      // 16 pro max
                      : 14.w, // 11 iphone20,14,
              child: SizedBox(
                width:
                    MediaQuery.of(context).size.height < 896
                        ? 380.w
                        /// Тест для СЕ
                        : MediaQuery.of(context).size.height > 896
                        ? 410.w
                        // 16 pro max
                        : 410.w, // 11 iphone20,410,
                child: Text(
                  textAlign: TextAlign.center,
                  'Have you tried breathing tehniques?',
                  style: TextStyle(
                    color: Color(0xfff19584),
                    fontSize:
                        MediaQuery.of(context).size.height < 896
                            ? 20.sp
                            /// Тест для СЕ
                            : MediaQuery.of(context).size.height > 896
                            ? 24
                                .sp // 16 pro max
                            : 22.sp, // 11 iphone20,24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),

            /// ЛИНИИ К ПЕРВОМУ
            Positioned(
              top:
                  MediaQuery.of(context).size.height < 896
                      ? 140.h
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 190.h
                      // 16 pro max
                      : 190.h,

              right:
                  MediaQuery.of(context).size.height < 896
                      ? 90.w
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 75.w
                      // 16 pro max
                      : 75.w,
              child: Image.asset(
                'assets/img/ovec.png',
                scale:
                    MediaQuery.of(context).size.height < 896
                        ? 1.2
                        /// Тест для СЕ
                        : MediaQuery.of(context).size.height > 896
                        ? 1
                        // 16 pro max
                        : 1,
              ),
            ),
            Positioned(
              top:
                  MediaQuery.of(context).size.height < 896
                      ? 140.h
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 190.h
                      // 16 pro max
                      : 190.h,

              right:
                  MediaQuery.of(context).size.height < 896
                      ? 90.w
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 75.w
                      // 16 pro max
                      : 75.w,
              child: Image.asset(
                'assets/img/svec.png',
                scale:
                    MediaQuery.of(context).size.height < 896
                        ? 1.2
                        /// Тест для СЕ
                        : MediaQuery.of(context).size.height > 896
                        ? 1
                        // 16 pro max
                        : 1,
              ),
            ),
            Positioned(
              top:
                  MediaQuery.of(context).size.height < 896
                      ? 140.h
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 190.h
                      // 16 pro max
                      : 190.h,

              right:
                  MediaQuery.of(context).size.height < 896
                      ? 90.w
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 75.w
                      // 16 pro max
                      : 75.w,
              child: Image.asset(
                'assets/img/tvec.png',
                scale:
                    MediaQuery.of(context).size.height < 896
                        ? 1.2
                        /// Тест для СЕ
                        : MediaQuery.of(context).size.height > 896
                        ? 1
                        // 16 pro max
                        : 1,
              ),
            ),
            // Первый выбор
            _buildSelectableCircle(
              0,
              "I want to improve my sleep",

              /// TOP
              MediaQuery.of(context).size.height < 896
                  ? 120
                  /// Тест для СЕ
                  : MediaQuery.of(context).size.height > 896
                  ? 209 // 16 pro max
                  : 200,

              //LEFT
              MediaQuery.of(context).size.height < 896
                  ? 90
                  /// Тест для СЕ
                  : MediaQuery.of(context).size.height > 896
                  ? 86 // 16 pro max
                  : 80, // 11 iphone
            ),

            /// ЛИНИИ КО ВТОРОМУ
            Positioned(
              top:
                  MediaQuery.of(context).size.height < 896
                      ? 310.h
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 355.h
                      // 16 pro max
                      : 355.h, // 11 iphone,,,
              right:
                  MediaQuery.of(context).size.height < 896
                      ? 30.w
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 5.w
                      // 16 pro max
                      : 5.w, // 11 iphone
              child: Image.asset(
                'assets/img/ovec.png',
                scale:
                    MediaQuery.of(context).size.height < 896
                        ? 1.2
                        /// Тест для СЕ
                        : MediaQuery.of(context).size.height > 896
                        ? 1
                        // 16 pro max
                        : 1,
              ), // 11 iphone
            ),
            Positioned(
              top:
                  MediaQuery.of(context).size.height < 896
                      ? 310.h
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 355.h
                      // 16 pro max
                      : 355.h, // 11 iphone,,,
              right:
                  MediaQuery.of(context).size.height < 896
                      ? 30.w
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 5.w
                      // 16 pro max
                      : 5.w, // 11 iphone
              child: Image.asset(
                'assets/img/svec.png',
                scale:
                    MediaQuery.of(context).size.height < 896
                        ? 1.2
                        /// Тест для СЕ
                        : MediaQuery.of(context).size.height > 896
                        ? 1
                        // 16 pro max
                        : 1,
              ),
            ),
            Positioned(
              top:
                  MediaQuery.of(context).size.height < 896
                      ? 310.h
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 355.h
                      // 16 pro max
                      : 355.h, // 11 iphone
              right:
                  MediaQuery.of(context).size.height < 896
                      ? 30.w
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 5.w
                      // 16 pro max
                      : 5.w, // 11 iphone
              child: Image.asset(
                'assets/img/tvec.png',
                scale:
                    MediaQuery.of(context).size.height < 896
                        ? 1.2
                        /// Тест для СЕ
                        : MediaQuery.of(context).size.height > 896
                        ? 1
                        // 16 pro max
                        : 1,
              ),
            ),
            // Второй выбор
            _buildSelectableCircle(
              1,
              "I need to relieve stress",
              MediaQuery.of(context).size.height < 896
                  ? 250
                  /// Тест для СЕ
                  : MediaQuery.of(context).size.height > 896
                  ? 383 // 16 pro max
                  : 360,
              MediaQuery.of(context).size.height < 896
                  ? 40
                  /// Тест для СЕ
                  : MediaQuery.of(context).size.height > 896
                  ? 14 // 16 pro max
                  : 15,
            ), // 11 iphone383, 14),
            /// ЛИНИИ К ТРЕТЬЕМУ
            Positioned(
              top:
                  MediaQuery.of(context).size.height < 896
                      ? 500.h
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 510.h
                      // 16 pro max
                      : 510.h, // 11 iphone, 545,
              right:
                  MediaQuery.of(context).size.height < 896
                      ? 35.w
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 6.w
                      // 16 pro max
                      : 6.w, // 11 iphone,,
              child: Image.asset(
                'assets/img/ovec.png',
                scale:
                    MediaQuery.of(context).size.height < 896
                        ? 1.2
                        /// Тест для СЕ
                        : MediaQuery.of(context).size.height > 896
                        ? 1
                        // 16 pro max
                        : 1,
              ),
            ),
            Positioned(
              top:
                  MediaQuery.of(context).size.height < 896
                      ? 500.h
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 510.h
                      // 16 pro max
                      : 510.h, // 11 iphone,,
              right:
                  MediaQuery.of(context).size.height < 896
                      ? 35.w
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 12.w
                      // 16 pro max
                      : 12.w, // 11 iphone,35,
              child: Image.asset(
                'assets/img/svec.png',
                scale:
                    MediaQuery.of(context).size.height < 896
                        ? 1.2
                        /// Тест для СЕ
                        : MediaQuery.of(context).size.height > 896
                        ? 1
                        // 16 pro max
                        : 1,
              ),
            ),
            Positioned(
              top:
                  MediaQuery.of(context).size.height < 896
                      ? 500.h
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 510.h
                      // 16 pro max
                      : 510.h, // 11 iphone,,
              right:
                  MediaQuery.of(context).size.height < 896
                      ? 35.w
                      /// Тест для СЕ
                      : MediaQuery.of(context).size.height > 896
                      ? 12.w
                      // 16 pro max
                      : 12.w, // 11 iphone,
              child: Image.asset(
                'assets/img/tvec.png',
                scale:
                    MediaQuery.of(context).size.height < 896
                        ? 1.2
                        /// Тест для СЕ
                        : MediaQuery.of(context).size.height > 896
                        ? 1.w
                        // 16 pro max
                        : 1.w,
              ), // 11 iphone,,),
            ),
            // Третий выбор
            _buildSelectableCircle(
              2,
              "I dream of becoming happier",
              MediaQuery.of(context).size.height < 896
                  ? 400
                  /// Тест для СЕ
                  : MediaQuery.of(context).size.height > 896
                  ? 554 // 16 pro max
                  : 520,
              MediaQuery.of(context).size.height < 896
                  ? 40
                  /// Тест для СЕ
                  : MediaQuery.of(context).size.height > 896
                  ? 21 // 16 pro max
                  : 21,
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
          radius:
              MediaQuery.of(context).size.height < 896
                  ? 50.5
                  /// Тест для СЕ
                  : MediaQuery.of(context).size.height > 896
                  ? 60.5
                  // 16 pro max
                  : 60.5, // 11 iphone
          child: _BuildOnboarding(
            text: text,
            fontSize:
                MediaQuery.of(context).size.height < 896
                    ? 14.sp
                    /// Тест для СЕ
                    : MediaQuery.of(context).size.height > 896
                    ? 17.sp
                    // 16 pro max
                    : 17.sp, // 11 iphone17,
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
