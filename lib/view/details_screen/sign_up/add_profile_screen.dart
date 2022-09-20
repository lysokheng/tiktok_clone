import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';

class AddProfileScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController birthdayController;

  AddProfileScreen(this.emailController, this.passwordController, this.birthdayController);
  @override
  State<AddProfileScreen> createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  final usernameController = TextEditingController();

  final _authController = Get.put(AuthController());
  Color backgroundColor = Colors.grey.shade800;

  Color foregroundColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Sign up'),
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.question_mark, color: Colors.grey),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create username and profile',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),

                //add profile
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _authController.pickImage();
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        //avatar
                        Positioned(
                          child: GetBuilder(
                              init: AuthController(),
                              builder: (state) {
                                if (_authController.profile == null) {
                                  return Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      //avatar
                                      const Positioned(
                                        child: CircleAvatar(
                                          radius: 60,
                                          child: Icon(
                                            Icons.person,
                                            size: 60,
                                          ),
                                        ),
                                      ),

                                      //icon and text
                                      Positioned(
                                        child: Container(
                                          width: 120,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.2),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Column(
                                            children: const [
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Icon(
                                                Icons.camera_alt,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Add',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return CircleAvatar(
                                      backgroundColor: Colors.white70,
                                      radius: 60,
                                      backgroundImage:
                                          FileImage(_authController.profile!));
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                //username
                TextField(
                  controller: usernameController,
                  style: const TextStyle(color: Colors.white),
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'Username',
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
                  height: 30,
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
                            print(usernameController.text);
                            print(widget.emailController.text);
                            print(
                                widget.passwordController.text);

                            print(widget.birthdayController.text);

                            _authController.signUp(
                                usernameController.text,
                                widget.birthdayController.text,
                                widget.emailController.text,
                                widget.passwordController.text,
                                _authController.profile.toString());

                          },
                          child: const Text('Sign up')),
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
