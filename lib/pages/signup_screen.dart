import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_tickets_booking/utils/mytheme.dart';
import 'package:movie_tickets_booking/utils/social_buttons.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name cannot be empty";
    }
    return null;
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

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Confirm Password cannot be empty";
    }
    if (value != _passwordController.text) {
      return "Passwords do not match";
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
              const SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(25),
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
                          "Create your account",
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
                          validator: _validateName,
                          decoration: _buildInputDecoration("Name", CupertinoIcons.person)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          validator: _validateEmail,
                          decoration: _buildInputDecoration("Email", CupertinoIcons.mail)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          validator: _validatePassword,
                          controller: _passwordController,
                          obscureText: _obscureText,
                          decoration: _buildPasswordDecoration("Password"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          validator: _validateConfirmPassword,
                          controller: _confirmPasswordController,
                          obscureText: _obscureText,
                          decoration: _buildPasswordDecoration("Confirm Password"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Proceed with signup
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
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      _buildSocialOrDivider(),
                      SocialLoginButtons(
                        onGoogleClick: () {},
                        onFacebookClick: () {},
                      ),
                    ],
                  ),
                ),
              ),
              _buildAlreadyAccountText(),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hintText, IconData icon) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon: Icon(icon, color: MyTheme.splash),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: MyTheme.greyColor,
    );
  }

  InputDecoration _buildPasswordDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon: Icon(CupertinoIcons.lock, color: MyTheme.splash),
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
    );
  }

  Widget _buildSocialOrDivider() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(children: [
        Expanded(
          child: Divider(color: Colors.black.withOpacity(0.3)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text("Or"),
        ),
        Expanded(
          child: Divider(color: Colors.black.withOpacity(0.3)),
        )
      ]),
    );
  }

  Widget _buildAlreadyAccountText() {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 0.1),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Already have an account?",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 20,
              ),
            ),
            TextSpan(
              text: " Login",
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.white.withOpacity(0.7),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pop(context);
                },
            ),
            TextSpan(
              text: " here!",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
