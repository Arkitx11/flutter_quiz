
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
    await dotenv.load(fileName: "env/clientId.env");
    var webClientId = dotenv.env['WEBCLIENT_ID'];


    final GoogleSignIn googleSignIn = GoogleSignIn(clientId: webClientId!);
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

    await supabaseInstance.client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  Future<void> signOut() async {
    try {
      await supabaseInstance.client.auth.signOut();
    } catch (error) {
      print('Error signing out: $error');
    }
  }
}
