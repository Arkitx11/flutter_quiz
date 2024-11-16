import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/shared/quiz_model.dart';

class LoginScreen extends StatelessWidget {
  final QuizModel quizModel;
  AsyncSnapshot<User?> loginSnapshot;

  LoginScreen({super.key, required this.loginSnapshot, required this.quizModel});

  @override
  Widget build(BuildContext context) {
    if (loginSnapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (loginSnapshot.hasError) {
      return LoginButton(
        response: 'Error',
        responseColor: Colors.red,
        quizModel: quizModel,
      );
    } else {
      return LoginButton(
        response: 'Login to continue',
        responseColor: Colors.black,
        quizModel: quizModel,
      );
    }
  }
}

class LoginButton extends StatelessWidget {
  final String response;
  final Color responseColor;
  final QuizModel quizModel;
  const LoginButton({super.key, required this.response, required this.responseColor, required this.quizModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              quizModel.getPhoneNumber();

            },
            child: Row(mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Icon(Icons.phone, ),
              const SizedBox(width: 10),
              Text('Phone'),
            ],),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              quizModel.signinAnonymously();
            },
            child: Row(mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Icon(Icons.account_circle, ),
              const SizedBox(width: 10),
              Text('Guest'),
            ],),
          ),
          Text(response, style: TextStyle(color: responseColor)),
        ],

        
      )
    );
  }
}


class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


