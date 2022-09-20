import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/view/log_in_screen.dart';
import 'package:tiktok_clone/view/widgets/main_screen.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
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
  String verificationID = "";
  User? user;

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

  void signUp(String username, String birthday, String email, String password,
      String profile) async {
    EasyLoading.show(status: 'loading...');

    try {
      Map<String, String> data = {
        'username': username,
        'birthday': birthday,
        'profile': profile,
        'email': email,
        'password': password,
      };
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(data);
      Get.snackbar('Message', 'Sign up successfully',
          backgroundColor: Colors.blueAccent, colorText: Colors.white);
      Get.offAll(() => MainScreen());
      EasyLoading.dismiss();
    } catch (e) {
      Get.snackbar('Error Occurred', e.toString(),
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      EasyLoading.dismiss();
    }
  }

  Future<void> signOut() async {
    EasyLoading.show(status: 'loading...');
    FirebaseAuth.instance.signOut();
    Get.to(() => LoginScreen());
    EasyLoading.dismiss();
  }

  Future loginWithEmail(String email, String password) async {
    EasyLoading.show(status: 'loading...');

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Message', 'Log in successfully',
          backgroundColor: Colors.blueAccent, colorText: Colors.white);
      Get.offAll(MainScreen());
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error Occurred', e.toString(),
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      EasyLoading.dismiss();
    }
  }

  void loginWithPhone(String phone) async {
    EasyLoading.show(status: 'loading...');

    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+855${phone}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
          if (kDebugMode) {
            Get.snackbar('Message', 'You are logged in successfully',
                backgroundColor: Colors.blueAccent, colorText: Colors.white);
            print("You are logged in successfully");
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        if (kDebugMode) {
          Get.snackbar('Error occurred', e.toString(),
              backgroundColor: Colors.redAccent, colorText: Colors.white);
          print(e.message);
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationID = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    EasyLoading.dismiss();
  }

  void verifyOTP(String otp) async {
    EasyLoading.show(status: 'loading...');

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otp);

    print("verification ID: $verificationID");

    await FirebaseAuth.instance.signInWithCredential(credential).then(
      (value) {
        user = FirebaseAuth.instance.currentUser;
      },
    ).whenComplete(
      () {
        if (user != null) {
          Get.snackbar('Message', 'You are logged in successfully',
              backgroundColor: Colors.blueAccent, colorText: Colors.white);
          Get.offAll(() => MainScreen());
          EasyLoading.dismiss();
        } else {
          Get.snackbar('Error occurred', 'Your login is failed',
              backgroundColor: Colors.redAccent, colorText: Colors.white);
          EasyLoading.dismiss();
        }
      },
    );
  }
}
