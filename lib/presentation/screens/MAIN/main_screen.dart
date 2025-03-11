import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8ecd6),
      body: Stack(
        children: [
          Positioned(left: 0, child: Image.asset('asset/img/lvec.png')),
          Positioned(right: 0, child: Image.asset('asset/img/rvec.png')),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Текст 1', style: TextStyle(fontSize: 18)),
                  Text('Текст 2', style: TextStyle(fontSize: 18)),
                  Text('Текст 3', style: TextStyle(fontSize: 18)),
                  Text('Текст 4', style: TextStyle(fontSize: 18)),
                  Text('Текст 5', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
