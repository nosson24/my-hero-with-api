import 'package:flutter/material.dart';
import 'package:test_project/style/main_app_color.dart';

class IntroExample extends StatelessWidget {
  final Color? color;
  final String? urlImage;
  final String? title;
  final String? subtitle;
  const IntroExample(
      {Key? key, this.color, this.urlImage, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            urlImage!,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          const SizedBox(height: 64),
          Text(
            title!,
            style: MainFontstyle.introTextTitle,
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(subtitle!,
            style: MainFontstyle.introTextSubTitle,),
          )
        ],
      ),
    );
  }
}
