import 'package:flutter/material.dart';
import 'package:test_project/style/main_app_color.dart';

class AvatarProfile extends StatelessWidget {
  final String imgPath;
  final String name;
  final String status;
  const AvatarProfile({
    Key? key,
    required this.imgPath,
    required this.name,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(90),
                color: Colors.blue),
            height: 172,
            width: 172,
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 90.0,
              backgroundImage: AssetImage(imgPath),
            ),
          ),
          Text(name, style: MainFontstyle.mainFontName),
          Text(
            status,
            style: MainFontstyle.mainFontNameClass,
          )
        ],
      ),
    );
  }
}
