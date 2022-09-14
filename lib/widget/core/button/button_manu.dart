import 'package:flutter/material.dart';
import 'package:test_project/style/main_app_color.dart';

class ButtonManu extends StatelessWidget {
  final VoidCallback? onPressedDelete;
  final VoidCallback? onPressedToList;
  final Text titleText;
  final Text subText;
  const ButtonManu({
    Key? key,
    this.onPressedDelete,
    this.onPressedToList,
    required this.titleText,
    required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 85,
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            decoration: const BoxDecoration(
              color: MainAppColor.mainColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: ListTile(
                onTap: onPressedToList,
                title: titleText,
                subtitle: subText,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                right: 20,
              ),
              width: 86,
              height: 85,
              decoration: const BoxDecoration(
                color: MainAppColor.buttonColor,
              ),
              child: GestureDetector(
                child: const Text(
                  "Done",
                  style: MainFontstyle.mainFont1,
                ),
                onTap: onPressedDelete,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
