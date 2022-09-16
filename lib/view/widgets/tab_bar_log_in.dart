import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/view/details_screen/log_in/log_in_email_screen.dart';
import 'package:tiktok_clone/view/details_screen/log_in/log_in_phone_screen.dart';


class TabBarLogin extends StatelessWidget {
  const TabBarLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Log in'),
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
            LogInPhoneScreen(),
            LoginEmailScreen(),
          ],
        ),
      ),
    );

  }
}
