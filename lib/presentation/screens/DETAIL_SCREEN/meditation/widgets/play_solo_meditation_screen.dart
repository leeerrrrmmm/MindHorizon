import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/widgets/end_meditation_screen.dart';
import 'package:vibration/vibration.dart';
import '../../../../../data/domain/auth/push.dart' show FirebaseMsg;

class PlaySoloMeditationScreen extends StatefulWidget {
  final String lonStepAsset;
  final List<Color>? colors;
  final String title;

  const PlaySoloMeditationScreen({
    super.key,
    required this.colors,
    required this.lonStepAsset,
    required this.title,
  });

  @override
  State<PlaySoloMeditationScreen> createState() =>
      _PlaySoloMeditationScreenState();
}

class _PlaySoloMeditationScreenState extends State<PlaySoloMeditationScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;
  bool isPlaying = false;
  bool isGeneralNotificationEnabled = true;
  bool isVibrateEnabled = true;
  final FirebaseMsg _notificationService = FirebaseMsg();

  @override
  void initState() {
    super.initState();
    getUserNotificationSettings();

    audioPlayer.onDurationChanged.listen((duration) {
      if (mounted) {
        setState(() {
          totalDuration = duration;
        });
      }
    });

    audioPlayer.onPositionChanged.listen((position) {
      if (mounted) {
        setState(() {
          currentPosition = position;
        });
      }
    });

    audioPlayer.onPlayerComplete.listen((event) async {
      triggerVibration();
      _sendNotification();

      if (mounted) {
        setState(() {
          isPlaying = false;
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EndMeditationScreen(colors: widget.colors),
          ),
        );
      }
    });
  }

  Future<void> getUserNotificationSettings() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var snapshot =
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(user.uid)
              .get();
      if (snapshot.exists) {
        setState(() {
          isGeneralNotificationEnabled =
              snapshot['notificationSettings']['sendNotification'] ?? true;
          isVibrateEnabled =
              snapshot['notificationSettings']['vibration'] ?? true;
        });
      }
    }
  }

  void _sendNotification() {
    if (isGeneralNotificationEnabled) {
      _notificationService.showLocalNotification(
        RemoteMessage(
          notification: RemoteNotification(
            title: 'MindHorizon',
            body: 'Step was finished!',
          ),
        ),
      );
    }
  }

  void triggerVibration() async {
    if (isVibrateEnabled && await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 1000, amplitude: 128);
    }
  }

  Future<void> _playPauseMusic() async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      try {
        await audioPlayer.play(AssetSource(widget.lonStepAsset));
      } catch (e) {
        log("Ошибка при воспроизведении: $e");
      }
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  double getProgress() {
    if (totalDuration.inMilliseconds == 0) return 0.0;
    return currentPosition.inMilliseconds / totalDuration.inMilliseconds;
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.colors?[7],
      body: Stack(
        children: [
          Positioned(
            left: 0,
            child: Image.asset('assets/img/lvec.png', color: widget.colors?[8]),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/img/rvec.png', color: widget.colors?[8]),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildText(
                  text: widget.title,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: widget.colors?[9],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 155,
                        width: 155,
                        child: CircularProgressIndicator(
                          backgroundColor: widget.colors?[1],
                          color: widget.colors?[2],
                          value: getProgress(),
                          strokeWidth: 10,
                        ),
                      ),
                      GestureDetector(
                        onTap: _playPauseMusic,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: widget.colors?[2],
                          child: Icon(
                            isPlaying
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
