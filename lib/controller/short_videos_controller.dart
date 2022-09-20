import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ShortVideosController extends GetxController {
  RxList<Map> lstVideos = RxList<Map>([]);

  @override
  void onInit() {
    lstVideos.bindStream(FirebaseFirestore.instance
        .collection('videos')
        .snapshots()
        .map((query) => query.docs as List<Map>));
    print('length of video ${lstVideos.length}');
    super.onInit();
  }
}
