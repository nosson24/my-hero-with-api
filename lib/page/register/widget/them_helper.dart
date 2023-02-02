import 'package:flutter/material.dart';
import 'package:test_project/style/main_app_color.dart';

class ThemeHelper {
  InputDecoration textInputDecoration(
      [String labelText = "", String hintText = ""]) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: MainFontstyle.labelText,
      hintText: hintText,
      hintStyle: MainFontstyle.hintText,
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
      ),
    );
  }

  InputDecoration textLoginInputDecoration(
      [String labelText = "", String hintText = ""]) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: MainFontstyle.loginlabelText,
      hintText: hintText,
      hintStyle: MainFontstyle.labelText,
      fillColor: Colors.white,
      filled: false,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
      ),
    );
  }

  BoxDecoration buttonCencelBoxDecoration(
    BuildContext context,
  ) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.white12,
      border: Border.all(width: 3, color: MainAppColor.normalColor),
    );
  }

  BoxDecoration buttonLoginBoxDecoration(
    BuildContext context,
  ) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: MainAppColor.introP1Color,
      border: Border.all(width: 3, color: MainAppColor.normalColor),
    );
  }
}
