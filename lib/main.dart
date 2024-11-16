import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/login/login.dart';
import 'package:flutter_quiz/routes.dart';
import 'package:flutter_quiz/services/auth.dart';
import 'package:flutter_quiz/shared/bottom_nav.dart';
import 'package:flutter_quiz/shared/quiz_model.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      return StreamBuilder(
          stream: AuthService().userStream,
          builder: (context, snapshot) {
            return MaterialApp(
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                darkTheme: ThemeData.dark(),
                home: Scaffold(
                  appBar: (snapshot.hasData)
                      ? AppBar(
                          title: const Text('Quiz App'),
                          actions: [
                            IconButton(
                                onPressed: () {
                                  quiz.signOut();
                                },
                                icon: Icon(Icons.logout))
                          ],
                        )
                      : null,
                  body: (snapshot.hasData)
                      ? quiz.navigationScreen
                      : LoginScreen(
                          loginSnapshot: snapshot,
                          quizModel: quiz,
                        ),
                  bottomNavigationBar: (snapshot.hasData)
                      ? BottomNavBar(
                          navigationIndex: quiz.navigationIndex,
                          onSelectingNavigation: quiz.onSelectingNavigation,
                        )
                      : null,
                ));
          });
    });
  }
}

/*
MaterialApp(
navigatorKey: navigatorKey,
debugShowCheckedModeBanner: false,
darkTheme: ThemeData.dark(),
home: Scaffold(
appBar: AppBar(
title: const Text('Quiz App'),
),
body: quiz.navigationScreen,
bottomNavigationBar: BottomNavBar(
navigationIndex: quiz.navigationIndex,
onSelectingNavigation: quiz.onSelectingNavigation),
),*/
