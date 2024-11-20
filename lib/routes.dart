import 'package:flutter_quiz/landing/landing.dart';
import 'package:flutter_quiz/setting/setting.dart';

import 'home/home.dart';
import 'login/login.dart';

var routes = {
  '/': (context) => LandingScreen(),
  '/login': (context) => LoginScreen(),
  '/home': (context) => HomeScreen(),
  '/about/settings': (context) => SettingScreen(),
};
