import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tiktok_clone/controller/short_videos_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class ShortVideosScreen extends StatefulWidget {
  const ShortVideosScreen({super.key});

  @override
  State<ShortVideosScreen> createState() => _ShortVideosScreenState();
}

class _ShortVideosScreenState extends State<ShortVideosScreen> {
  ShortVideosController shortVideosController =
      Get.put(ShortVideosController());
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        shortVideosController.lstVideos[3]['videoURL'])
      ..initialize().then((_) {
        _controller.play;
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
