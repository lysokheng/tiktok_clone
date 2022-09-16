import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/view/log_in_screen.dart';
import 'package:tiktok_clone/view/widgets/tab_bar_sign_up.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //header
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        children: [
                          const Text(
                            'Sign up for TikTok',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Create a profile, follow other account, make your own video, and more.',
                            style: TextStyle(color: Colors.grey, height: 1.2),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: TextButton.icon(
                                      onPressed: () {
                                        Get.to(() => const TabBarSignUp());
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.grey.shade800,
                                      ),
                                      icon: const Icon(
                                        Icons.person_outline_outlined,
                                        color: Colors.white,
                                      ),
                                      label: const Text(
                                        'Use phone or email',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: TextButton.icon(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.grey.shade800,
                                      ),
                                      icon: const Icon(
                                        Icons.facebook,
                                        color: Colors.blue,
                                      ),
                                      label: const Text(
                                        'Continue with Facebook',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: TextButton.icon(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.grey.shade800,
                                      ),
                                      icon: const Icon(
                                        Icons.apple,
                                        color: Colors.white,
                                      ),
                                      label: const Text(
                                        'Continue with Apple',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 200,),
              //footer
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'By continuing, you agree to our',
                              style: TextStyle(
                                color: Colors.grey,
                                height: 1.5,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              ' Term of Service ',
                              style: TextStyle(
                                  color: Colors.white,
                                  height: 1.5,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'and',
                              style: TextStyle(
                                  color: Colors.grey,
                                  height: 1.5,
                                  fontSize: 11),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'acknowledge that you have read our',
                              style: TextStyle(
                                  color: Colors.grey,
                                  height: 1.5,
                                  fontSize: 11),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              ' Privacy Policy ',
                              style: TextStyle(
                                  color: Colors.white,
                                  height: 1.5,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'to learn how',
                              style: TextStyle(
                                  color: Colors.grey,
                                  height: 1.5,
                                  fontSize: 11),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'we collect, use, and share your data.',
                              style: TextStyle(
                                  color: Colors.grey,
                                  height: 1.5,
                                  fontSize: 11),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(color: Colors.grey.shade800),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Already have an acount?',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            ' Log in',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
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
    );
  }
}
