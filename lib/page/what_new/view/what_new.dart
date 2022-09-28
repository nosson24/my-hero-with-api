import 'package:flutter/material.dart';
import 'package:test_project/page/home_tab/view/profile_page.dart';
import 'package:test_project/page/what_new/bloc/backgroun_what_new.dart';
import 'package:test_project/page/what_new/widget/show_list_new.dart';
import 'package:test_project/style/main_app_color.dart';

class WhatsNew extends StatefulWidget {
  const WhatsNew({Key? key}) : super(key: key);

  @override
  State<WhatsNew> createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgrounWhatNew(),
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "What's New?",
                  style: MainFontstyle.whatNewTitle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const ShowListNew(),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: MainAppColor.introP1Color,
                      border: Border.all(
                          width: 3, color: MainAppColor.normalColor)),
                  margin:
                      const EdgeInsets.only(left: 70, right: 70, bottom: 20),
                  height: 50,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Start Now!',
                        style: MainFontstyle.signUpText,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
