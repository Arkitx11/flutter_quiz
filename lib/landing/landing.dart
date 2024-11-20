import 'package:flutter/material.dart';
import 'package:flutter_quiz/home/home.dart';
import 'package:flutter_quiz/login/login.dart';
import 'package:flutter_quiz/services/auth.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Authentication().userStream,
        builder: (context, snapshot) {
          print(snapshot.toString());
          if (snapshot.data?.session != null) {
            return HomeScreen();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          } else if (snapshot.hasError) {
            return const Scaffold(body: Center(child: Text('Error')));
          } else {
            return LoginScreen();
          }
        });
  }
}
