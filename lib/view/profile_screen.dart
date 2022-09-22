import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/view/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person_add_alt_outlined,
            color: Colors.white,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 60,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.grey.shade300,
                      size: 14,
                    ),
                    Text(
                      'Add name',
                      style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.white,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.remove_red_eye_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  color: Colors.black,
                  height: 180,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.person_outline,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Creator tools',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          horizontalTitleGap: 0,
                          minVerticalPadding: 0,
                          onTap: () {
                            Get.to(() => SettingsScreen());
                            print('width ${MediaQuery.of(context).size.width}');

                            print(
                                'height ${MediaQuery.of(context).size.height}');
                          },
                        ),
                        const Divider(
                          color: Colors.grey,
                          indent: 15,
                          endIndent: 15,
                        ), // THIS

                        ListTile(
                          leading: const Icon(
                            Icons.settings_outlined,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Settings and privacy',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          horizontalTitleGap: 0,
                          minVerticalPadding: 0,
                          onTap: () {
                            Get.to(() => SettingsScreen());
                          },
                        ),
                        const Divider(
                          color: Colors.grey,
                          indent: 15,
                          endIndent: 15,
                        ), // THIS
                      ],
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            //body
            SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.4,
              // decoration: BoxDecoration(color: Colors.grey),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            //avatar
                            const Positioned(
                              child: CircleAvatar(
                                radius: 50,
                                child: Icon(
                                  Icons.person,
                                  size: 60,
                                ),
                              ),
                            ),

                            //icon add post
                            Positioned(
                              child: Container(
                                width: 100,
                                height: 100,
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
                                      size: 26,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Add',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.cyan,
                                      Colors.cyanAccent,
                                    ],
                                  ),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.black, width: 2)),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              )))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Username',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, right: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            Text(
                              '0',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            Text(
                              'Following',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              '0',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            Text(
                              'Follower',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              '0',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            Text(
                              'Like',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 40, right: 40),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(3)),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                'Set up profile',
                                style: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(3)),
                        child: Center(
                          child: Row(
                            children: const [
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
