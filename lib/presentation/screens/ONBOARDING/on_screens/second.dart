import 'dart:math' as math;
import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  final Function(bool) onItemSelected;
  const Second({super.key, required this.onItemSelected});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
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

            // Заголовок
            Positioned(
              top: 105,
              left: 14,
              child: SizedBox(
                width: 410,
                child: Text(
                  textAlign: TextAlign.center,
                  'Have you tried breathing tehniques?',
                  style: TextStyle(
                    color: Color(0xfff19584),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            Positioned(
              top: 270,
              left: -239,
              child: Transform(
                alignment: Alignment.center,
                transform:
                    Matrix4.identity()
                      ..rotateZ(60.3 * (math.pi / 180))
                      ..scale(-1.0, 1.0), // Зеркальное отражение по горизонтали
                child: Image.asset('assets/gif/der.gif'),
              ),
            ),

            /// ЛИНИИ К ПЕРВОМУ
            Positioned(
              top: 200,
              right: 75,
              child: Image.asset('assets/img/ovec.png'),
            ),
            Positioned(
              top: 200,
              right: 75,
              child: Image.asset('assets/img/svec.png'),
            ),
            Positioned(
              top: 200,
              right: 75,
              child: Image.asset('assets/img/tvec.png'),
            ),
            // Первый выбор
            _buildSelectableCircle(0, "No, never before", 209, 86),

            /// ЛИНИИ КО ВТОРОМУ
            Positioned(
              top: 374,
              right: 5,
              child: Image.asset('assets/img/ovec.png'),
            ),
            Positioned(
              top: 374,
              right: 5,
              child: Image.asset('assets/img/svec.png'),
            ),
            Positioned(
              top: 374,
              right: 5,
              child: Image.asset('assets/img/tvec.png'),
            ),
            // Второй выбор
            _buildSelectableCircle(1, "Yes, a long time ago", 383, 14),
            // БОКОВОЙ ЕЛЕМЕНТ
            Positioned(
              bottom: -50,
              right: 0,
              child: Image.asset('assets/img/side.png'),
            ),

            /// ЛИНИИ К ТРЕТЬЕМУ
            Positioned(
              top: 545,
              right: 12,
              child: Image.asset('assets/img/ovec.png'),
            ),
            Positioned(
              top: 545,
              right: 12,
              child: Image.asset('assets/img/svec.png'),
            ),
            Positioned(
              top: 545,
              right: 12,
              child: Image.asset('assets/img/tvec.png'),
            ),
            // Третий выбор
            _buildSelectableCircle(2, "Yes, i pricice regulary", 554, 21),
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
          radius: 62.5,
          child: _BuildOnboarding(
            text: text,
            fontSize: 17,
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
