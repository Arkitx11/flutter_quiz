import 'package:flutter/material.dart';

import '../shared/bottom_nav.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter Quiz App', style: TextStyle(fontSize: 24)),
            Text('Version: 1.0.0', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
