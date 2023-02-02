import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/page/introduction_screen/view/intro_screen.dart';
import 'package:test_project/page/register/widget/them_helper.dart';
import 'package:test_project/style/main_app_color.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResetEmail = false;
  Timer? timer;
    



  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => chackEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future chackEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResetEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() => canResetEmail = true);
    } catch (e) {
      print(e);
    }
  }




  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const IntroScreen()
      : Scaffold(
          backgroundColor: MainAppColor.mainColor,
          appBar: AppBar(
            backgroundColor: MainAppColor.topBarColor,
            title: const Text('Verify Email'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'A Verification email has been\nsend to your email',
                    style: MainFontstyle.loginText,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: Container(
                      decoration:
                          ThemeHelper().buttonLoginBoxDecoration(context),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.mail_outline,
                              color: MainAppColor.textColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Reset Password',
                              style: MainFontstyle.signUpText,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () => canResetEmail ? sendVerificationEmail() : null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      decoration:
                          ThemeHelper().buttonCencelBoxDecoration(context),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Cencel',
                          style: MainFontstyle.mainFont1,
                        ),
                      ),
                    ),
                    onTap: () => FirebaseAuth.instance.signOut(),
                  ),
                ],
              ),
            ),
          ),
        );
}
