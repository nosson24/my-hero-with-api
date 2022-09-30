import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_project/page/introduction_screen/bloc/intro_example.dart';
import 'package:test_project/page/what_new/view/what_new.dart';
import 'package:test_project/style/main_app_color.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: const [
            IntroExample(
              color: MainAppColor.introP1Color,
              urlImage: 'assets/intro_all_might.png',
              title: 'Application',
              subtitle: 'My Hero',
            ),
            IntroExample(
              color: MainAppColor.introP2Color,
              urlImage: 'assets/all_might.png',
              title: 'Application',
              subtitle: 'My Hero',
            ),
            IntroExample(
              color: MainAppColor.introP3Color,
              urlImage: 'assets/intro_all_might.png',
              title: 'Application',
              subtitle: 'My Hero',
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                backgroundColor: MainAppColor.buttonColor,
                minimumSize: const Size.fromHeight(80),
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showProfile', true);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const WhatsNew()));
              },
              child: const Text(
                "Get Started",
                style: MainFontstyle.introTextTitle,
              ))
          : Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text('Skip'),
                    onPressed: () => controller.jumpToPage(2),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      count: 3,
                      controller: controller,
                      effect: const WormEffect(
                        spacing: 16,
                        dotColor: MainAppColor.darkColor,
                        activeDotColor: MainAppColor.mainColor,
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Text('Next'),
                    onPressed: () => controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
