import 'package:flutter/material.dart';
import 'package:test_project/style/main_app_color.dart';
import 'package:test_project/widget/core/card/appbar/follow_bar.dart';
import 'package:test_project/widget/core/card/hero_profile/avatar_profile.dart';

class ListProfile extends StatelessWidget {
  final String imgPath;
  final String name;
  final String status;

  const ListProfile({
    Key? key,
    required this.imgPath,
    required this.name,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: MainAppColor.mainColor,
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 22,
            ),
            Container(
              decoration: const BoxDecoration(
                color: MainAppColor.topBarColor,
              ),
              width: MediaQuery.of(context).size.width,
              height: 63,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: MainAppColor.normalColor,
                        size: 18,
                      ),
                    ),
                  ),
                  const Center(
                      child: Text("Other profile",
                          style: MainFontstyle.mainFont1)),
                ],
              ),
            ),
            AvatarProfile(
              imgPath: imgPath,
              name: name,
              status: status,
            ),
            const FollowBar(),
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      const BoxDecoration(color: MainAppColor.normalColor),
                  child: SingleChildScrollView(
                    child: Column(
                      children: const <Widget>[],
                    ),
                  )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  decoration:
                      const BoxDecoration(color: MainAppColor.normalColor),
                  child: Container(
                    margin: const EdgeInsets.only(left: 28),
                    child: const Text(
                      "10 Tasks remain",
                      style: MainFontstyle.mainFont2,
                    ),
                  ),
                ),
              ],
            ),
            /////
          ],
        ),
      ),
    );
  }
}
