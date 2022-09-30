import 'package:flutter/material.dart';

class MainAppColor {
  static const Color mainColor = Color.fromRGBO(185, 47, 35, 1);
  static const Color buttonColor = Color.fromRGBO(42, 198, 76, 1);
  static const Color topBarColor = Color.fromRGBO(157, 39, 28, 1);
  static const Color bottomBarColor = Color.fromRGBO(248, 242, 242, 1);
  static const Color normalColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color introP1Color = Color.fromARGB(255, 243, 199, 3);
  static const Color introP2Color = Color.fromARGB(255, 253, 95, 3);
  static const Color introP3Color = Color.fromARGB(255, 250, 66, 66);
  static const Color textColor = Color.fromARGB(255, 215, 61, 0);
  static const Color darkColor = Color.fromARGB(255, 139, 137, 137);
}

class MainFontstyle {
  static const TextStyle mainFont1 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(255, 255, 255, 1),
  );
  static const TextStyle mainFont2 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(0, 0, 0, 1),
  );
  static const TextStyle mainFontName = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Color.fromRGBO(255, 255, 255, 1),
  );
  static const TextStyle mainFontNameClass = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(255, 255, 255, 1),
  );
  static const TextStyle mainFontNameClass2 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 0, 0, 0),
  );
  static const TextStyle mainFontNameClass3 = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: MainAppColor.introP2Color);
  static const TextStyle introTextTitle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(255, 255, 255, 1),
  );
  static const TextStyle loginText = TextStyle(
    fontSize: 18,
    // fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 178, 178, 178),
  );
  static const TextStyle signUpText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: MainAppColor.textColor,
  );
  static const TextStyle introTextSubTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(255, 255, 255, 1),
  );
  static const TextStyle whatNewTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255),
  );
}
