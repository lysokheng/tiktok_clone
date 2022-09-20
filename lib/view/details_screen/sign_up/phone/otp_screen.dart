import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';

class OTPScreen extends StatelessWidget {
  final String phoneNumber;

  const OTPScreen(this.phoneNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    final pinController = TextEditingController();
    AuthController authController = Get.put(AuthController());

    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;
    final countDownController = CountdownTimerController(endTime: endTime);

    const defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.black,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
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
        padding:
        const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter 6-digit code',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'Your code was sent to ',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '+855 $phoneNumber',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Pinput(
              controller: pinController,
              defaultPinTheme: defaultPinTheme,
              submittedPinTheme: submittedPinTheme,
              length: 6,
              androidSmsAutofillMethod:  AndroidSmsAutofillMethod.smsRetrieverApi,
              validator: (s) {
                return s == authController.verificationID ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pinController) => print(pinController),
              onSubmitted: (pinController){
                authController.verifyOTP(pinController);
              },
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                const Text(
                  'Resend code ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                CountdownTimer(
                  controller: countDownController,
                  endTime: endTime,
                  endWidget: const Text(''),
                  textStyle: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              children: const [
                Text(
                  'Did\'t get a code? ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Request phone call',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
