import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneAuth extends StatelessWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
