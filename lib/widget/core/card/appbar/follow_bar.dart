

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/style/main_app_color.dart';

class FollowBar extends StatelessWidget {
   final VoidCallback? onPressedFollowers;
    final VoidCallback? onPressedFollowing;
  const FollowBar({Key? key, this.onPressedFollowers, this.onPressedFollowing, }) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: MainAppColor.bottomBarColor,
      ),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
      onTap: onPressedFollowers ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "9M",
            style: GoogleFonts.roboto(
              textStyle: MainFontstyle.mainFont1,
              color: MainAppColor.mainColor,
            ),
          ),
          Text(
            "Followers",
            style: GoogleFonts.roboto(textStyle: MainFontstyle.mainFont2),
          ),
        ],
      ),
    ),
          Container(
            margin: const EdgeInsets.all(14),
            width: 6,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: MainAppColor.mainColor,
            ),
          ),
          InkWell(
      onTap: onPressedFollowing,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "1,660",
            style: GoogleFonts.roboto(
              textStyle: MainFontstyle.mainFont1,
              color: MainAppColor.mainColor,
            ),
          ),
          Text(
            "Following",
            style: GoogleFonts.roboto(textStyle: MainFontstyle.mainFont2),
          ),
        ],
      ),
    ),
        ],
      ),
    );
  }
}