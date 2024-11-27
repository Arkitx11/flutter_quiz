import 'package:flutter/material.dart';

import '../shared/bottom_nav.dart';

class ScoreCardScreen extends StatelessWidget {
  const ScoreCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(),
        appBar: AppBar(
      title: const Text('Score Card'),
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Score: 10/10', style: TextStyle(fontSize: 24)),
            Text('Time: 00:00:00', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
