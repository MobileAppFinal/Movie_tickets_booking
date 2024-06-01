
import 'dart:async';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_tickets_booking/utils/mytheme.dart';

import '../pages/home_screen.dart';
import '../pages/login_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;

  bool isLogin = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(_auth.currentUser);
    _user.bindStream(_auth.authStateChanges());
    ever(_user, LoginRedirect);
  }

  LoginRedirect(User? user) {
    Timer(Duration(seconds: isLogin ? 0 : 2), () {
      if (user == null) {
        isLogin = false;
        update();
        Get.offAll(() => const LoginScreen());
      } else {
        isLogin = true;
        update();
        Get.offAll(() => const HomeScreen());
      }
    });
  }

  void registerUser(String email, String password) async {
    try {
      isLogin = true;
      update();
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      // define error message
      getErrorSnackBar('Error creating account', e);
    }
  }

  getErrorSnackBar(String message, _) {
   Get.snackbar(
      'Error',
      "$message\n${_.message}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: MyTheme.redBorder,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  void loginUser(String email,String password) async {
    try {
      isLogin = true;
      update();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      getErrorSnackBar('Error signing in', e);
    }
  }

  void signOut() async {
    await _auth.signOut();
  }

}
