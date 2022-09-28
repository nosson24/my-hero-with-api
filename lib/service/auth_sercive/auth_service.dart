import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test_project/page/introduction_screen/view/intro_screen.dart';
import 'package:test_project/page/login/view/login_page.dart';


class AuthService {
  final googleSignIn = GoogleSignIn();
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.data != null && snapshot.hasData) {
            return const IntroScreen();
          } else {
            return const LoginPage();
          }
        });
  }

  signInWithGoogle() async {

    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();


    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );


    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }
}
