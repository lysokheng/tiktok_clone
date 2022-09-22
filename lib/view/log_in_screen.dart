import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/view/profile_screen.dart';
import 'package:tiktok_clone/view/sign_up_screen.dart';
import 'package:tiktok_clone/view/widgets/tab_bar_log_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1))
        .then((value) => {FlutterNativeSplash.remove()});
  }

  @override
  Widget build(BuildContext context) {
    AuthController _authController = Get.put(AuthController());

    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.97,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //header
                  Column(
                    children: [
                      RPadding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.cancel_outlined,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.question_mark,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      //body
                      Center(
                        child: RPadding(
                          padding: EdgeInsets.only(left: 30, right: 30).r,
                          child: Column(
                            children: [
                              Text(
                                'Log in to TikTok',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'Manage your account, check notification, comment on videos, and more',
                                style: TextStyle(
                                    color: Colors.grey, height: 1.2.h),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: TextButton.icon(
                                          onPressed: () {
                                            Get.to(() => const TabBarLogin());
                                            _authController.obs;
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                                Colors.grey.shade800,
                                          ),
                                          icon: const Icon(
                                            Icons.person_outline_outlined,
                                            color: Colors.white,
                                          ),
                                          label: Text(
                                            'Use phone or email',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.sp),
                                          ))),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: TextButton.icon(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                                Colors.grey.shade800,
                                          ),
                                          icon: Icon(
                                            Icons.facebook,
                                            color: Colors.blue,
                                          ),
                                          label: Text(
                                            'Continue with Facebook',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ))),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: TextButton.icon(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                                Colors.grey.shade800,
                                          ),
                                          icon: const Icon(
                                            Icons.apple,
                                            color: Colors.white,
                                          ),
                                          label: const Text(
                                            'Continue with Apple',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 200.h,
                  // ),
                  //footer
                  Spacer(),
                  Column(
                    children: [
                      // SizedBox(
                      //   height: 70.h,
                      // ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SignUpScreen());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration:
                              BoxDecoration(color: Colors.grey.shade800),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                ),
                              ),
                              Text(
                                ' Sign up',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
