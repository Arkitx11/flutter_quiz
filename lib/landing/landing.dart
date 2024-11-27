import 'package:flutter/material.dart';
import 'package:flutter_quiz/login/login.dart';
import 'package:flutter_quiz/providers/navigaton_provider.dart';
import 'package:flutter_quiz/services/auth.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Authentication().userStream,
        builder: (context, snapshot) {
          print(snapshot.toString());
          if (snapshot.data?.session != null) {
            return Consumer<NavigationProvider>(
                builder: (context, navigationProvider, child) =>
                    navigationProvider.ui);
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
