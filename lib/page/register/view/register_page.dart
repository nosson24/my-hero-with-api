// import 'package:email_validator/email_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:test_project/model/register_model.dart';
import 'package:test_project/page/register/widget/them_helper.dart';
import 'package:test_project/service/auth_sercive/auth_service.dart';
import 'package:test_project/service/controllre/function.dart';
import 'package:test_project/style/main_app_color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
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
    return Scaffold(
      backgroundColor: MainAppColor.bottomBarColor,
      appBar: AppBar(
        backgroundColor: MainAppColor.topBarColor,
        title: const Text(
          'Account Creation Page',
          style: MainFontstyle.mainFont1,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 25),
                TextFormField(
                  controller: nameController,
                  decoration:
                      ThemeHelper().textInputDecoration('Name', 'Enter Name'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 2
                      ? 'Enter a valid Name'
                      : null,
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: lastNameController,
                  decoration: ThemeHelper()
                      .textInputDecoration('Last Name', 'Enter Last Name'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 2
                      ? 'Enter a valid Last Name'
                      : null,
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: ThemeHelper().textInputDecoration(
                      'Phone Number', 'Enter Phone Number'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length != 10
                      ? 'Enter 10 Phone Number'
                      : null,
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: emailController,
                  decoration:
                      ThemeHelper().textInputDecoration('Email', 'Enter Email'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: passwordController,
                  decoration: ThemeHelper().textInputDecoration(
                      'Password', 'รหัสผ่านอย่างน้อย 6 หลัก'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 6
                      ? 'Enter min. 6 characters'
                      : null,
                ),
                // const SizedBox(height: 10),
                // InkWell(
                //   child: Container(
                //     decoration: ThemeHelper().buttonLoginBoxDecoration(context),
                //     child: const Padding(
                //       padding: EdgeInsets.all(8.0),
                //       child: Text('send OTP'),
                //     ),
                //   ),
                //   onTap: () {},
                // ),
                // const SizedBox(height: 10),
                // TextField(
                //   obscureText: true,
                //   decoration: ThemeHelper()
                //       .textInputDecoration('OTP', 'โปรดระบุ OTP'),
                // ),
                const SizedBox(height: 50),
                InkWell(
                  child: Container(
                    decoration: ThemeHelper().buttonLoginBoxDecoration(context),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Text(
                        'Create Account',
                        style: MainFontstyle.signUpText,
                      ),
                    ),
                  ),
                  onTap: () {
                    final createUser = RegisterModel(
                      name: nameController.text,
                      lastName: lastNameController.text,
                      phoneNumber: phoneNumberController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    AuthService()
                        .createUserWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                          context,
                        )
                        .then(
                          (value) => FirebaseService().createEmailAndPassword(
                            registerModel: createUser,
                          ),
                        );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
