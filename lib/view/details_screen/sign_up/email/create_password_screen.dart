import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'birthday_screen.dart';

class CreatePasswordScreen extends StatefulWidget {

  final TextEditingController emailController;
  CreatePasswordScreen(this.emailController);

  TextEditingController passwordController = TextEditingController();

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {

  Color backgroundColor = Colors.grey.shade800;

  Color foregroundColor = Colors.grey;

  Color checkColor = Colors.grey.shade800;

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
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create password',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            //password
            TextField(
              controller: widget.passwordController,
              style: const TextStyle(color: Colors.white),
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Enter password',
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
                  if (widget.passwordController.text.length >= 8) {
                    backgroundColor = val.isNotEmpty
                        ? Colors.redAccent
                        : Colors.grey.shade800;
                    foregroundColor =
                        val.isNotEmpty ? Colors.white : Colors.grey.shade800;
                    checkColor = val.isNotEmpty
                        ? Colors.greenAccent
                        : Colors.grey.shade800;
                  } else {
                    backgroundColor = Colors.grey.shade800;
                    foregroundColor = Colors.grey;
                    checkColor = Colors.grey.shade800;
                  }
                });
              },
            ),

            const SizedBox(
              height: 10,
            ),
            const Text(
              'Your password must have:',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: checkColor,
                ),
                const Text(
                  ' 8 to 20 characters',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: checkColor,
                ),
                const Text(
                  ' Letters, numbers, and special characters',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
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
                        print(widget.passwordController.text);
                        Get.to(() => BirthdayScreen(widget.emailController, widget.passwordController));
                      },
                      child: const Text('Next')),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
