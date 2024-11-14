import 'package:flutter/material.dart';
import 'package:flutter_quiz/routes.dart';
import 'package:flutter_quiz/shared/bottom_nav.dart';
import 'package:flutter_quiz/shared/quiz_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => QuizModel(),
    child: const QuizApp(),
  ));
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizModel>(builder: (context, quiz, child) {
      return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Quiz App'),
          ),
          body: quiz.navigationScreen,
          bottomNavigationBar:  BottomNavBar(navigationIndex: quiz.navigationIndex, onSelectingNavigation: quiz.onSelectingNavigation),
        ),
      );
    });
  }
}
