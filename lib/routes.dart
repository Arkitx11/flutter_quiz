import 'package:flutter_quiz/landing/landing.dart';
import 'package:flutter_quiz/setting/setting.dart';

import 'login/login.dart';

var routes = {
  '/': (context) => LandingScreen(),
  '/login': (context) => LoginScreen(),
  '/about/settings': (context) => SettingScreen(),
};
