import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class Authentication {
  final supabaseInstance = Supabase.instance;
  final userStream = Supabase.instance.client.auth.onAuthStateChange;
  final currentUser = Supabase.instance.client.auth.currentUser;

  Future<void> signInAnonymously() async {
    try {

      await supabaseInstance.client.auth.signInAnonymously();
    } catch (error) {
      print('Error signing in anonymously: $error');
    }
  }

  Future<void> nativeGoogleSignIn() async {
    await dotenv.load(fileName: "clientId.env");
    var webClientId = dotenv.env['WEB_CLIENT_ID'];

    final GoogleSignIn googleSignIn = GoogleSignIn(
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    if (Platform.isAndroid) {
      await supabaseInstance.client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    }
    if (!Platform.isAndroid || !Platform.isIOS) {
      await supabaseInstance.client.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: kIsWeb ? null : 'my.scheme://my-host', // Optionally set the redirect link to bring back the user via deeplink.
        authScreenLaunchMode:
        kIsWeb ? LaunchMode.platformDefault : LaunchMode.externalApplication, // Launch the auth screen in a new webview on mobile.
      );

    }


  }

  Future<void> signOut() async {
    try {
      await supabaseInstance.client.auth.signOut();
    } catch (error) {
      print('Error signing out: $error');
    }
  }
}
