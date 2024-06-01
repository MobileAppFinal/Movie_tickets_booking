import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_tickets_booking/pages/home_screen.dart';
import 'package:movie_tickets_booking/pages/start_screen.dart';
import 'package:movie_tickets_booking/pages/profile_screen.dart';

import 'package:movie_tickets_booking/utils/mytheme.dart';

import 'controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: MyTheme.myLightTheme,
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}
