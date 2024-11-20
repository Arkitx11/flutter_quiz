import 'package:flutter/material.dart';
import 'package:flutter_quiz/services/auth.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Home'),
      actions: [
        IconButton(
            onPressed: () async {
              await Authentication().signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);

            },
            icon: Icon(Ionicons.log_out))
      ],
    ));
  }
}
