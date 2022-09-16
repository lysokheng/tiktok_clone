import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/view/video_preview_screen.dart';

class HomeController extends GetxController {
  pickVideo() async {
    EasyLoading.show(status: 'loading...');

    try {
      final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
      if(video != null) {
        Get.to(() => VideoPreviewScreen(videoPath: File(video.path),));
      }
      EasyLoading.dismiss();
    } catch (e) {
      Get.snackbar('Error Occurred', e.toString());
      EasyLoading.dismiss();
    }
  }
}