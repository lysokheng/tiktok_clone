import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/view/sign_up_screen.dart';
import 'package:tiktok_clone/view/widgets/tab_bar_log_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                            'Log in to TikTok',
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
                            'Manage your account, check notification, comment on videos, and more',
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
                                        Get.to(() => const TabBarLogin());
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
              SizedBox(
                height: 200,
              ),
              //footer
              Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SignUpScreen());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(color: Colors.grey.shade800),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            ' Sign up',
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
