import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AlarmMedia extends StatefulWidget {
  const AlarmMedia({super.key});

  @override
  State<AlarmMedia> createState() => _AlarmMediaState();
}

class _AlarmMediaState extends State<AlarmMedia> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.networkUrl(Uri.parse("http://13.126.15.56/stream/AK700/53188_illgalParking.mp4"),
      )
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Media"),
      ),
      body: Center(
        child: AspectRatio(
            aspectRatio: 16/9,
            child: FlickVideoPlayer(flickManager: flickManager)
        ),

      ),
    );
  }
}

