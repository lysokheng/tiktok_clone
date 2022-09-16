import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/view/details_screen/sign_up/email/sign_up_email_screen.dart';
import 'package:tiktok_clone/view/details_screen/sign_up/phone/sign_up_phone_screen.dart';

class TabBarSignUp extends StatelessWidget {
  const TabBarSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Sign up'),
          backgroundColor: Colors.black,
          leading: IconButton( onPressed: () {
            Get.back();
          }, icon: Icon(Icons.arrow_back_ios, color: Colors.white), ),
          actions: [
            IconButton( onPressed: () {
            }, icon: Icon(Icons.question_mark, color: Colors.grey), ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Phone',),
              Tab(text: 'Email',),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SignUpPhoneScreen(),
            SignUpEmailScreen(),
          ],
        ),
      ),
    );
  }
}
