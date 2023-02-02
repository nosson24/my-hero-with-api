import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/style/main_app_color.dart';
import 'package:test_project/widget/core/card/appbar/bottom_bar.dart';
import 'package:test_project/widget/core/card/hero_profile/hero_card.dart';

class FollowersPage extends StatefulWidget {
  const FollowersPage({Key? key}) : super(key: key);

  @override
  State<FollowersPage> createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage> {
  // Widget _topBar() {
  //   return Container(
  //     decoration: const BoxDecoration(
  //       color: MainAppColor.topBarColor,
  //     ),
  //     width: MediaQuery.of(context).size.width,
  //     height: 63,
  //     child: Stack(
  //       children: [
  //         Align(
  //           alignment: Alignment.centerLeft,
  //           child: IconButton(
  //             onPressed: () async {
  //               Navigator.pop(context);
  //             },
  //             icon: const Icon(
  //               Icons.arrow_back_ios,
  //               color: MainAppColor.normalColor,
  //               size: 18,
  //             ),
  //           ),
  //         ),
  //         const Center(
  //             child: Text("Followers", style: MainFontstyle.mainFont1)),
  //       ],
  //     ),
  //   );
  // }

  Widget _mainList() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: MainAppColor.normalColor,
        ),
        child: ListView(
          children: const [
            HeroCard(
              imgPath: 'assets/imageProfile3.png',
              name: 'Nezu',
              heroClass: 'Princial',
            ),
            HeroCard(
              imgPath: 'assets/imageProfile2.png',
              name: 'All Might',
              heroClass: 'Heroics Teacher',
            ),
            HeroCard(
              imgPath: 'assets/imageProfile4.png',
              name: 'Midnight',
              heroClass: 'Modern Hero Art History Teacher',
            ),
            HeroCard(
              imgPath: 'assets/imageProfile5.png',
              name: 'Eraser Head',
              heroClass: 'Class 1-A Homeroom Teacher',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainAppColor.topBarColor,
        title: const Text(
          "Followers",
          style: MainFontstyle.mainFont1,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 22,
          ),
          // _topBar(),
          _mainList(),
          BottomBar(
            numberData: Text(
              "4 Follower",
              style: GoogleFonts.roboto(textStyle: MainFontstyle.mainFont2),
            ),
          ),
        ],
      ),
    );
  }

  // void _onNavigate(Widget page) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) {
  //       return page;
  //     }),
  //   );
  // }
}
