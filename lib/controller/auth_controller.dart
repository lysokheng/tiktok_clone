import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/view/log_in_screen.dart';
import 'package:tiktok_clone/view/profile_screen.dart';
import 'package:tiktok_clone/view/widgets/main_screen.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user != null) {
        Get.offAll(() => MainScreen());
        print('User is already login : ${user.uid}');
      } else {
        Get.offAll(() => LoginScreen());
        print('User is not login yet : ${user?.uid}');

      }
    });
    super.onInit();
  }

  File? profile;

  void pickImage() async {
    EasyLoading.show(status: 'loading...');

    final pickImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 75,
    );
    final path = 'profiles/${pickImage!.name}';
    final file = File(pickImage.path);
    // FirebaseAuth.instance.currentUser!.uid
    Reference ref = FirebaseStorage.instance.ref().child(path);

    await ref.putFile(file);

    ref.getDownloadURL().then((value) => print(value));

    if (pickImage == null) {
      return;
    }
    profile = File(pickImage.path);
    update();
    EasyLoading.dismiss();

  }

  void signUp(String username, String birthday, String email, String password) async {
    EasyLoading.show(status: 'loading...');

    try {
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
      Get.snackbar('Message', 'Sign up successfully', backgroundColor: Colors.blueAccent, colorText: Colors.white);
      Get.offAll(() => MainScreen());
      EasyLoading.dismiss();

    } catch (e) {
      Get.snackbar('Error Occurred', e.toString(), backgroundColor: Colors.redAccent, colorText: Colors.white);
      EasyLoading.dismiss();

    }
  }

  void signOut() {
    EasyLoading.show(status: 'loading...');

    FirebaseAuth.instance.signOut();
    Get.to(() => LoginScreen());
    EasyLoading.dismiss();

  }

  Future logIn(String email, String password) async {
    EasyLoading.show(status: 'loading...');

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Message', 'Log in successfully', backgroundColor: Colors.blueAccent, colorText: Colors.white);
      Get.offAll(MainScreen());
      EasyLoading.dismiss();

    } on FirebaseAuthException catch (e) {
        Get.snackbar('Error Occurred', e.toString(), backgroundColor: Colors.redAccent, colorText: Colors.white);
        EasyLoading.dismiss();

    }
  }
}
