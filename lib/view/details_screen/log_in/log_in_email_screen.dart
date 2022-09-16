import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/view/profile_screen.dart';
import 'package:tiktok_clone/view/widgets/main_screen.dart';

import '../../../main.dart';

class LoginEmailScreen extends StatefulWidget {
  const LoginEmailScreen({Key? key}) : super(key: key);

  @override
  State<LoginEmailScreen> createState() => _LoginEmailScreenState();
}

class _LoginEmailScreenState extends State<LoginEmailScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  Color backgroundColor = Colors.grey.shade800;

  Color foregroundColor = Colors.grey;
  AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //email
                    TextField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        alignLabelWithHint: true,
                      ),
                      onChanged: (val) {
                        setState(() {
                          backgroundColor = val.isNotEmpty
                              ? Colors.redAccent
                              : Colors.grey.shade800;
                          foregroundColor =
                              val.isNotEmpty ? Colors.white : Colors.grey;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    //password
                    TextField(
                      controller: passwordController,
                      style: const TextStyle(color: Colors.white),
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        alignLabelWithHint: true,
                      ),
                      onChanged: (val) {
                        setState(() {
                          backgroundColor = val.isNotEmpty
                              ? Colors.redAccent
                              : Colors.grey.shade800;
                          foregroundColor =
                              val.isNotEmpty ? Colors.white : Colors.grey;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    const Text(
                      'Forgot password?',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //button
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: backgroundColor,
                                  foregroundColor: foregroundColor),
                              onPressed: () {
                                _authController.logIn(emailController.text, passwordController.text);
                              },
                              child: const Text('Login')),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
