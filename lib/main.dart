import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/view/widgets/main_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tiktok_clone/view/log_in_screen.dart';
import 'package:tiktok_clone/view/sign_up_screen.dart';

import 'bindings/auth_binding.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FirebasePhoneAuthProvider(
      child: GetMaterialApp(
        navigatorKey: navigatorKey,
        initialBinding: AuthBinding(),
        builder: EasyLoading.init(),
        title: 'TikTok Clone',
        home: const LoginScreen(),
        theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: const TextTheme(
            headline1: TextStyle(color: Colors.white),
            headline2: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
            subtitle1: TextStyle(color: Colors.white),
          ),
        ).copyWith(scaffoldBackgroundColor: Colors.black87),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
