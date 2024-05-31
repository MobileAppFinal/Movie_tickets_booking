import 'package:flutter/material.dart';
import 'package:movie_tickets_booking/pages/start_screen.dart';
import 'package:movie_tickets_booking/utils/mytheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.myLightTheme,
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}

