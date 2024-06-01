import 'package:flutter/material.dart';
import 'package:movie_tickets_booking/controllers/auth_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              AuthController.instance.signOut();
            },
            child: Text('Logout')),
      ),
    );
  }
}
