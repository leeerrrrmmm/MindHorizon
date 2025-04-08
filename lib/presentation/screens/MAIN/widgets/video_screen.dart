import 'package:flutter/material.dart';
import 'package:mind_horizon/data/models/category_fields_model.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key, required this.video, required this.secIndex});
  final CategoryFields? video;
  final int secIndex;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.video!.videoPath ?? '')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            _controller.value.isInitialized
                ? Stack(
                  children: [
                    Positioned.fill(
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),

                    Positioned(
                      left: MediaQuery.of(context).size.width / 2.3,
                      bottom: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                        child: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                      ),
                    ),
                  ],
                )
                : const CircularProgressIndicator(),
      ),
    );
  }
}
