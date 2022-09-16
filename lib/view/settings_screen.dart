import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/view/log_in_screen.dart';
import 'package:tiktok_clone/view/sign_up_screen.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  Dialog customDialog = Dialog(
    backgroundColor: Colors.grey.shade900,
    // your color
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    // change 40 to your desired radius
    child: CustomAlertDialog(),
  );

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Settings and privacy',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'ACCOUNT',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 14),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
              title: Text(
                'Manage account',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.lock_outline,
                color: Colors.white,
              ),
              title: Text(
                'Privacy',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.verified_user_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Security and login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.account_balance_wallet_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Balance',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.qr_code_outlined,
                color: Colors.white,
              ),
              title: Text(
                'QR code',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.share_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Share profile',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const Divider(
              color: Colors.grey,
              indent: 15,
              endIndent: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'CONTENT & ACTIVITY',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 14),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.notifications_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Push notification',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
              title: Text(
                'LIVE Events',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.language,
                color: Colors.white,
              ),
              title: Text(
                'Language',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.dark_mode_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Dark mode',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.history_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Watch history',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.videocam_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Content preference',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.announcement_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Ads',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.umbrella_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Digital Wellbeing',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.house_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Family Pairing',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.accessibility_new_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Accessibility',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const Divider(
              color: Colors.grey,
              indent: 15,
              endIndent: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'CACHE & CELLULAR DATA',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 14),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.recycling_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Clear cache',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Text(
                '0 M',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.data_exploration_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Data Saver',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const Divider(
              color: Colors.grey,
              indent: 15,
              endIndent: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'ABOUT',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 14),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.circle_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Community Guildelines',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.book_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Term of Service',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.policy_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Privacy Policy',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.copyright_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Copyright Policy',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const ListTile(
              leading: Icon(
                Icons.broken_image_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Join TikTok Testers',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            const Divider(
              color: Colors.grey,
              indent: 15,
              endIndent: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'LOGIN',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 14),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.swap_horizontal_circle_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Switch account',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 14,
              ),
              minLeadingWidth: 0,
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
              title: const Text(
                'Log out',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              minLeadingWidth: 0,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) =>
                      Container(
                        color: Colors.black,
                        height: 280,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          child: Column(
                            children: [
                              ListTile(
                                title: const Center(
                                  child: Text(
                                    'Are you sure you want to log out?',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
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
                              ),
                              // THIS

                              const ListTile(
                                title: Center(
                                  child: Text(
                                    'Switch account',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                horizontalTitleGap: 0,
                                minVerticalPadding: 0,
                              ),
                              const Divider(
                                color: Colors.grey,
                                indent: 15,
                                endIndent: 15,
                              ),
                              // THIS
                              ListTile(
                                title: const Center(
                                  child: Text(
                                    'Log out',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                horizontalTitleGap: 0,
                                minVerticalPadding: 0,
                                onTap: () {
                                  showDialog(
                                    barrierDismissible: true,
                                    // set false if you don't want the dialog to be dismissed when user taps anywhere [![enter image description here][1]][1]outside of the alert
                                    context: context,
                                    builder: (context) {
                                      return customDialog;
                                    },
                                  );
                                },
                              ),
                              Divider(
                                color: Colors.grey.shade800,
                                thickness: 10,
                              ),
                              // THIS
                              ListTile(
                                title: const Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                horizontalTitleGap: 0,
                                minVerticalPadding: 0,
                                onTap: () {
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                );
              },
            ),
            const Divider(
              color: Colors.grey,
              indent: 15,
              endIndent: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(50),
              child: Center(
                child: Text(
                  'v25.9.0(2590290)',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  CustomAlertDialog({super.key});
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Center(
                    child: Text(
                      'Log out?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      'You\'ll log out of user',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.grey, width: 1),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    child: Center(
                      child: Text(
                        'Log out',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    onTap: () {
                      authController.signOut();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
