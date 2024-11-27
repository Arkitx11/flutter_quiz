import 'package:flutter/cupertino.dart';
import 'package:flutter_quiz/about/about.dart';
import 'package:flutter_quiz/home/home.dart';
import 'package:flutter_quiz/scorecard/scorecard.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get index => _selectedIndex;
  final List<StatelessWidget> _uiList = [
    HomeScreen(),
    ScoreCardScreen(),
    AboutScreen(),
  ];
   StatelessWidget ui = HomeScreen() ;

  void onSelect(int index) {
    switch(index) {
      case 0:
        _selectedIndex = 0;
        ui = _uiList[_selectedIndex];
        notifyListeners();
        break;
      case 1:
        _selectedIndex = 1;
        ui = _uiList[_selectedIndex];
        notifyListeners();
        break;
      case 2:
        _selectedIndex = 2;
        ui = _uiList[_selectedIndex];
        notifyListeners();
        break;
      default:
        _selectedIndex = 0;
        ui = _uiList[_selectedIndex];
        notifyListeners();
        break;
    }
  }
}