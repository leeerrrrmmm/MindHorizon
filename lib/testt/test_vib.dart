import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class TestVib extends StatefulWidget {
  const TestVib({super.key});

  @override
  State<TestVib> createState() => _TestVibState();
}

class _TestVibState extends State<TestVib> {
  bool? isActiveVibro;

  void checkVibro() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var shapshor =
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(user.uid)
              .get();
      if (shapshor.exists) {
        final vibroValue =
            shapshor['notificationSettings']?['vibration'] ?? false;
        setState(() {
          isActiveVibro = vibroValue;
        });

        if (vibroValue == true && await Vibration.hasVibrator() ?? false) {
          await Vibration.vibrate(duration: 1000, amplitude: 1);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: checkVibro,
          child: Text('Click to me'),
        ),
      ),
    );
  }
}
