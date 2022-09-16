import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/view/details_screen/sign_up/phone/otp_screen.dart';

class SignUpPhoneScreen extends StatefulWidget {
  const SignUpPhoneScreen({Key? key}) : super(key: key);

  @override
  State<SignUpPhoneScreen> createState() => _SignUpPhoneScreenState();
}

Color backgroundColor = Colors.grey.shade800;

Color foregroundColor = Colors.grey;

class _SignUpPhoneScreenState extends State<SignUpPhoneScreen> {
  final phoneController = TextEditingController();

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
                //phone number
                TextField(
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                  autofocus: true,
                  controller: phoneController,
                  decoration: const InputDecoration(
                    hintText: 'Phone number',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixText: 'KH +855  |  ',
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 0, minHeight: 0),
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    prefixIconColor: Colors.white,
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
                const Text(
                  'Your phone number will be used to improve your TikTok experience, including connecting you with people you may know, personalizing your ads experience, and more.',
                  style: TextStyle(color: Colors.grey, height: 1.2),
                ),
                Row(
                  children: const [
                    Text(
                      'If you sign up with SMS, SMS fees may apply.',
                      style: TextStyle(color: Colors.grey, height: 1.2),
                    ),
                    Text(
                      ' Learn more',
                      style: TextStyle(
                          color: Colors.white,
                          height: 1.2,
                          fontSize: 13,
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
                            Get.to(() => OTPScreen(phoneController.text));
                          },
                          child: const Text('Send code')),
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
