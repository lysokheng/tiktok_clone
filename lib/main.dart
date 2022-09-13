import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/view/home_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tiktok_clone/view/sign_up_screen.dart';

import 'bindings/auth_binding.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      title: 'TikTok Clone',
      home: SignUpScreen(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        inputDecorationTheme: const InputDecorationTheme(

        ),
      ).copyWith(scaffoldBackgroundColor: Colors.grey.shade900),
      debugShowCheckedModeBanner: false,
    );
  }
}
