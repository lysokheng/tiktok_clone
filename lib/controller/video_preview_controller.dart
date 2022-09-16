import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';

class VideoPreviewController extends GetxController {
  @override
  void onInit() {
    // uploadVideo();
    super.onInit();
  }

  uploadVideo(String video,String caption) async {
    EasyLoading.show(status: 'loading...');

    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final docs = await FirebaseFirestore.instance.collection('videos').get();

    final length = docs.docs.length;

    final videoURL = await uploadToStorage("video $length", video);
    final thumbnailURL = await uploadToStorage("thumbnail $length", video);

    Map<String, dynamic> data = {
      'caption': caption,
      'uid': uid,
      'likes': [],
      'comments': 0,
      'share' : 0,
      'thumbnail': thumbnailURL,
      'videoURL': videoURL,
      // 'profile': (documentSnapshot.data() as Map[''])
    };

    if(caption == null){
      return;
    }
    EasyLoading.dismiss();

  }

  compressVideo(String videoPath) async {
    return await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.LowQuality);
  }

  uploadThumbnail(String uid, String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);

    Reference reference =
        FirebaseStorage.instance.ref().child('users').child(uid);
    final uploadTask = reference.putFile(thumbnail);
    TaskSnapshot taskSnapshot = await uploadTask;
    String imageURL = await taskSnapshot.ref.getDownloadURL();
  }

  uploadToStorage(String uid, String video) async {
    Reference reference =
        FirebaseStorage.instance.ref().child('users').child(uid);
    final uploadTask = reference.putFile(compressVideo(video));
    TaskSnapshot taskSnapshot = await uploadTask;
    String imageURL = await taskSnapshot.ref.getDownloadURL();
  }
}