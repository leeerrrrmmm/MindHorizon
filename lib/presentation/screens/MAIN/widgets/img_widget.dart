import 'package:flutter/material.dart';

class ImgWidget extends StatelessWidget {
  const ImgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(left: 0, child: Image.asset('asset/img/lvec.png')),
        Positioned(right: 0, child: Image.asset('asset/img/rvec.png')),
      ],
    );
  }
}
