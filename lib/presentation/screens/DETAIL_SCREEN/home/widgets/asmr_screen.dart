import 'package:flutter/material.dart';

class AsmrScreen extends StatelessWidget {
  final String imagePath;
  const AsmrScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            Positioned.fill(child: Image.asset(imagePath, fit: BoxFit.cover)),
            Positioned(
              top: 73,
              right: 20,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Color(0xfffea386),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, color: Colors.white, size: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
