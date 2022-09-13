import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/view/details_screen/sign_up/user_info_screen.dart';
import 'package:tiktok_clone/view/home_screen.dart';
import 'package:tiktok_clone/view/profile_screen.dart';

class LoginEmailUsername extends StatefulWidget {
   LoginEmailUsername({Key? key}) : super(key: key);

  @override
  State<LoginEmailUsername> createState() => _LoginEmailUsernameState();
}

class _LoginEmailUsernameState extends State<LoginEmailUsername> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  Color backgroundColor = Colors.grey.shade800;

  Color foregroundColor = Colors.grey;
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
                    hintText: 'Email or username',
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
                      backgroundColor =
                      val.isNotEmpty ? Colors.redAccent : Colors.grey.shade800;
                      foregroundColor = val.isNotEmpty ? Colors.white : Colors.grey;
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
                      backgroundColor =
                      val.isNotEmpty ? Colors.redAccent : Colors.grey.shade800;
                      foregroundColor = val.isNotEmpty ? Colors.white : Colors.grey;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),

                Text('Forgot password?', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500
                ),),

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
                              foregroundColor: foregroundColor
                          ),
                          onPressed: () {
                            Get.to(() => ProfileScreen(
                            ));
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
