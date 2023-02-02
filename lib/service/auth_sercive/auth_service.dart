import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test_project/main.dart';
import 'package:test_project/page/login/view/login_page.dart';
import 'package:test_project/service/auth_sercive/verify_email_page.dart';

class AuthService {
  final googleSignIn = GoogleSignIn();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  handleAuthState() {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong!'),
            );
          } else if (snapshot.hasData) {
            return const VerifyEmailPage();
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




  Future<void> signOut(BuildContext context) async {
    await Firebase.initializeApp().then((value) async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );
      try {
        FirebaseAuth.instance
            .signOut()
            .then((value) => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyApp(
                          // showProfile: false,
                        )),
                (route) => false));
      } on FirebaseAuthException catch (e) {
        print(e);
        // Utils.showSnackBar(e.message);
      }

      // FirebaseAuth.instance.signOut().then((value) =>
      //     Navigator.pushAndRemoveUntil(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => const MyApp(showProfile: false)),
      //         (route) => false));
    });
    // await googleSignIn.disconnect();
    // await FirebaseAuth.instance.signOut();
  }

  Future<void> signInEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      // Utils.showSnackBar(e.message);
    }
  }

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => const Center(child: CircularProgressIndicator()),
    // );

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          )
          .then(
            (value) => Navigator.of(context).popUntil((route) => route.isFirst),
            // Navigator.pushAndRemoveUntil(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const MyApp()),
            //           (route) => false)
          );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<void> resetPassword(BuildContext context, String email) async {
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => const Center(child: CircularProgressIndicator()),
    // );
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      // Utils.showSnackBar('Password Reset Email sent');
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);
      // Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}
