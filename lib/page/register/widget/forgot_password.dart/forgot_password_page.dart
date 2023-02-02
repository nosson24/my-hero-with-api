import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:test_project/page/register/widget/them_helper.dart';
import 'package:test_project/service/auth_sercive/auth_service.dart';
import 'package:test_project/style/main_app_color.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainAppColor.topBarColor,
        title: const Text('Reset Password'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Receive an email to\nreset your Password.',
                style: MainFontstyle.signUpText,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: ThemeHelper()
                    .textInputDecoration('Email', 'Enter a valid email'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter a valid email'
                        : null,
              ),
              const SizedBox(height: 20),
              InkWell(
                child: Container(
                  decoration: ThemeHelper().buttonLoginBoxDecoration(context),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Reset Password',
                      style: MainFontstyle.signUpText,
                    ),
                  ),
                ),
                onTap: () =>
                    AuthService().resetPassword(context, emailController.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
