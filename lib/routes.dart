import 'package:flutter/material.dart';
import 'ui.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/settings': (context) => const SettingScreen(),
};

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
