import 'package:flutter/material.dart';
import 'package:flutter_quiz/services/auth.dart';
import 'package:ionicons/ionicons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage('images/icon_flutter.png'),
                width: 125,
                height: 125,
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton.outlined(
                    onPressed: () => Authentication().nativeGoogleSignIn(),
                    icon: Icon(
                      Ionicons.logo_google,
                      semanticLabel: 'Sign in With Google',
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  IconButton.outlined(
                    onPressed: () {
                      Authentication().signInAnonymously();
                    },
                    icon: Icon(
                      Ionicons.logo_android,
                      semanticLabel: 'Anonymous Login',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Login'),
        ));
  }
}
