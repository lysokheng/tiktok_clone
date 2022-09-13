import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tiktok_clone/view/details_screen/sign_up/sign_up_email.dart';

class AuthController extends GetxController {
  File? profile;

  void pickImage() async {
    final pickImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 75,
    );
    final path = 'profiles/${pickImage!.name}';
    final file = File(pickImage.path);

    Reference ref = FirebaseStorage.instance.ref().child(path);

    await ref.putFile(file);

    ref.getDownloadURL().then((value) => print(value));

    if (pickImage == null) {
      return;
    }
    profile = File(pickImage.path);
    update();
  }

  void register(String username, String birthday, String email, String password) async {
    Map<String, String> data = {
      'username': username,
      'birthday': birthday,
      'email': email,
      'password': password,
    };
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set(data);
  }

}
