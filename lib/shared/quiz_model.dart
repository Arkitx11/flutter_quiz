import 'package:flutter/material.dart';
import 'package:flutter_quiz/ui.dart';


class QuizModel extends ChangeNotifier {
  int _navigationIndex = 0;
  StatelessWidget navigationScreen = const HomeScreen();

  int get navigationIndex => _navigationIndex;

  void onSelectingNavigation(int index) {
    switch (index) {
      case 0:
        _navigationIndex = 0;
        navigationScreen = const HomeScreen();
        notifyListeners();
        break;
      case 1:
        _navigationIndex = 1;
        navigationScreen = const ScoreCardScreen();
        notifyListeners();
        break;
      case 2:
        _navigationIndex = 2;
        navigationScreen = const AboutScreen();
        notifyListeners();
        break;
    }
  }
}
