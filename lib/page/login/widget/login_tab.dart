import 'package:flutter/material.dart';
import 'package:test_project/page/register/view/register_page.dart';
import 'package:test_project/page/register/widget/forgot_password.dart/forgot_password_page.dart';
import 'package:test_project/page/register/widget/them_helper.dart';
import 'package:test_project/service/auth_sercive/auth_service.dart';
import 'package:test_project/style/main_app_color.dart';

class LoginTab extends StatefulWidget {
  const LoginTab({Key? key}) : super(key: key);

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              style: const TextStyle(color: Colors.white),
              decoration: ThemeHelper()
                  .textLoginInputDecoration('Email :', 'Enter Email'),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              style: const TextStyle(color: Colors.white),
              decoration: ThemeHelper()
                  .textLoginInputDecoration('Password :', 'Enter Password'),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage()));
            },
            child: const Text('Forgot Password ?'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
                },
                child: const Text('Register now ?'),
              ),
              InkWell(
                child: Container(
                  decoration: ThemeHelper().buttonLoginBoxDecoration(context),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'SIGN IN',
                      style: MainFontstyle.signUpText,
                    ),
                  ),
                ),
                onTap: () => AuthService().signInEmailAndPassword(
                    emailController.text, passwordController.text),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              AuthService().signInWithGoogle();
            },
            child: Container(
              decoration: ThemeHelper().buttonLoginBoxDecoration(context),
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset('assets/google-logo.png'),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
