import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/view/details_screen/sign_up/create_password.dart';
import 'package:tiktok_clone/view/details_screen/sign_up/sign_up_email.dart';
import 'package:tiktok_clone/view/details_screen/sign_up/user_info_screen.dart';
import 'package:tiktok_clone/view/profile_screen.dart';

class Birthday extends StatefulWidget {

  final TextEditingController emailController;
  final TextEditingController passwordController;
  Birthday(this.emailController, this.passwordController);

  TextEditingController birthdayController = TextEditingController();

  @override
  State<Birthday> createState() => _BirthdayState();
}

class _BirthdayState extends State<Birthday> {
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'When\'s your birthday?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Your birthady won\'t be shown publicly',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.cake,
                  color: Colors.white,
                  size: 60,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            //birthday
            TextField(
              // will disable paste operation
              enableInteractiveSelection: false,
              focusNode: AlwaysDisabledFocusNode(),
              controller:  widget.birthdayController,
              style: const TextStyle(color: Colors.white),
              autofocus: false,
              decoration: const InputDecoration(
                hintText: 'Birthday',
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
                        foregroundColor: foregroundColor,
                      ),
                      onPressed: () {
                        print(widget.birthdayController.text);
                        Get.to(() => UserInfoScreen(widget.emailController,
                        widget.passwordController,
                        widget.birthdayController));
                      },
                      child: const Text('Next')),
                ),
              ],
            ),
            const Spacer(),
            //pick birth date
            Row(
              children: [
                Expanded(
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent),
                      ),
                      onPressed: () async {
                         backgroundColor = Colors.redAccent;
                         foregroundColor = Colors.white;
                        DateTime? pickedDate = await DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            // minTime: DateTime(2018, 3, 5),
                            // maxTime: DateTime(2019, 6, 7),
                            theme: const DatePickerTheme(
                              headerColor: Colors.black,
                              backgroundColor: Colors.black,
                              itemStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              doneStyle:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              cancelStyle:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          print('confirm $date');
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                        if (pickedDate != null) {
                          setState(() {
                            widget.birthdayController.text =
                                DateFormat('dd MMMM yyyy').format(pickedDate);
                          });
                        }
                      },
                      child: const Text(
                        'Pick date',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
