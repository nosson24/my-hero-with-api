import 'package:flutter/material.dart';
import 'package:test_project/service/auth_sercive/auth_service.dart';
import 'package:test_project/style/main_app_color.dart';

class LoginTab extends StatefulWidget {
  const LoginTab({Key? key}) : super(key: key);

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Welcome',
            style: MainFontstyle.introTextTitle,
          ),
          const SizedBox(height: 10),
          const Text(
            "Time to My Hero let's Sign in",
            style: MainFontstyle.loginText,
          ),
          const SizedBox(height: 40),
          InkWell(
            onTap: () {
              AuthService().signInWithGoogle();
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: MainAppColor.introP1Color,
                  border:
                      Border.all(width: 3, color: MainAppColor.normalColor)),
              margin: const EdgeInsets.only(
                left: 70,
                right: 70,
              ),
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/google-logo.png'),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text(
                        'Sign up with Google',
                        style: MainFontstyle.signUpText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
