import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:movie_tickets_booking/pages/signup_screen.dart';
import 'package:movie_tickets_booking/utils/mytheme.dart';
import 'package:movie_tickets_booking/utils/social_buttons.dart';

import '../controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email cannot be empty";
    }
    if (!value.contains('@')) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: MyTheme.splash,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
        height: _size.height,
        width: _size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/ticket.svg',
                  height: 80,
                ),
                const SizedBox(width: 20),
                const Column(
                  children: [
                    Text(
                      'Movie Tickets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 40),
                    Text(
                      '- Booking -',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                "Wellcome to",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                   fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Movie Tickets Booking",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                "Login to continue",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(20),
                  width: _size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Login to your account",
                            style: TextStyle(
                              color: MyTheme.splash.withOpacity(0.7),
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextFormField(
                            controller: _emailController,
                            validator: _validateEmail,
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: const Icon(
                                CupertinoIcons.mail,
                                color: MyTheme.splash,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: MyTheme.greyColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextFormField(
                            controller: _passwordController,
                            validator: _validatePassword,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: const Icon(
                                CupertinoIcons.lock,
                                color: MyTheme.splash,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                                  color: MyTheme.splash,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: MyTheme.greyColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: MyTheme.splash,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  AuthController.instance.loginUser(
                                    _emailController.text.trim(),
                                    _passwordController.text.trim(),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyTheme.splash,
                                padding: const EdgeInsets.all(15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.black.withOpacity(0.3)
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text( "Or"),
                              ),
                              Expanded(
                                child: Divider(
                                    color: Colors.black.withOpacity(0.3)
                                ),
                              )
                            ]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: SocialLoginButtons(onGoogleClick: (){}, onFacebookClick: (){}),
                        )
                      ],
                    ),
                  ),
                ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: "Sign up",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen()));

                        Get.to(SignupScreen());
                      },
                  ),
                  TextSpan(
                    text: " here!",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
