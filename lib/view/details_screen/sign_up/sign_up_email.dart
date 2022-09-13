import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/view/details_screen/sign_up/create_password.dart';

class SignUpEmail extends StatefulWidget {
   SignUpEmail({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();


  @override
  State<SignUpEmail> createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
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
              children: [
                //email
                TextField(
                  controller: widget.emailController,
                  style: const TextStyle(color: Colors.white),
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'Email address',
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

                //description
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.circle_outlined,
                          color: Colors.grey,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Get trending content, newsletters, promotions,',
                          style: TextStyle(
                            color: Colors.white,
                            height: 1.2,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          'recommendations, and account updates sent to your',
                          style: TextStyle(
                              color: Colors.white, height: 1.2, fontSize: 13),
                        ),
                        Text(
                          'email',
                          style: TextStyle(
                              color: Colors.white, height: 1.2, fontSize: 13),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'By continuing, you agree to TikTok\'s ',
                      style: TextStyle(color: Colors.grey, height: 1.2),
                    ),
                    Text(
                      'Terms of Service',
                      style: TextStyle(
                          color: Colors.white,
                          height: 1.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'and confirm that you have read TikTok\'s ',
                      style: TextStyle(
                        color: Colors.grey,
                        height: 1.4,
                      ),
                    ),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                          color: Colors.white,
                          height: 1.4,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
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
                            print(widget.emailController);
                            Get.to(() => CreatePassword(widget.emailController));
                          },
                          child: const Text('Next')),
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
