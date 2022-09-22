import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:tiktok_clone/controller/short_videos_controller.dart';
import 'package:video_player/video_player.dart';

class ShortVideosScreen extends StatefulWidget {
  @override
  State<ShortVideosScreen> createState() => _ShortVideosScreenState();
}

class _ShortVideosScreenState extends State<ShortVideosScreen> {
  final controller = Get.put(ShortVideosController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX<ShortVideosController>(
            init: ShortVideosController(),
            builder: (controller) {
              return PageView.builder(
                controller: PageController(initialPage: 0, viewportFraction: 1),
                itemCount: controller.lstVideos.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return VideoPlayerWidget(
                      videoURL: controller.lstVideos[index].videoURL);
                },
              );
            }));
  }
}

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key, required this.videoURL});
  final videoURL;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController videoPlayerController;
  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    EasyLoading.show(status: 'loading...');
    videoPlayerController = VideoPlayerController.network(widget.videoURL)
      ..initialize().then((_) {
        videoPlayerController.play();
        EasyLoading.dismiss();

        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: Get.width,
          height: Get.height,
          child: VideoPlayer(videoPlayerController)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            videoPlayerController.value.isPlaying
                ? videoPlayerController.pause()
                : videoPlayerController.play();
          });
        },
        child: Icon(
          videoPlayerController.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow,
        ),
      ),
    );
  }
}
