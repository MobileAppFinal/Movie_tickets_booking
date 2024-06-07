import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:movie_tickets_booking/pages/start_screen.dart';

import 'package:movie_tickets_booking/utils/mytheme.dart';

import 'controllers/auth_controller.dart';
import 'controllers/location_controller.dart';
import 'controllers/common_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  Get.put(LocationController());
  Get.put(CommonController());
  Stripe.publishableKey = "pk_test_51PPBtWGRliW42lY2uqYo3tiCUBV41uWx0nQGdxCUGyOl0EUj1ektNo4tKsSzNIMS2m2pMfYUIdS4HXYqI4ZmM4ol00lEeUA3Ns";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        //MyTheme.myLightTheme,
        appBarTheme: AppBarTheme(
          backgroundColor: MyTheme.splash,
          foregroundColor: Colors.white,
        ),
      ),
      
      debugShowCheckedModeBanner: false,
      
      home:const StartScreen(),
    );
  }
}
