import 'package:flutter/material.dart';
import 'package:test_project/page/login/bloc/background_logni.dart';
import 'package:test_project/page/login/widget/login_tab.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          BackgroundLogin(),
          LoginTab(),
        ],
      ),
    );
  }
}

