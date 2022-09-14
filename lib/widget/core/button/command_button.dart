import 'package:flutter/material.dart';
import 'package:test_project/style/main_app_color.dart';

class CommandButton extends StatelessWidget {
  final VoidCallback? onPressedDelete;
  final VoidCallback? onPressedEdit;

  const CommandButton({
    Key? key,
    this.onPressedDelete,
    this.onPressedEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
            right: 20,
          ),
          width: 86,
          height: 85,
          decoration: const BoxDecoration(
            color: Colors.amber,
          ),
          child: GestureDetector(
            child: const Text(
              "Edit",
              style: MainFontstyle.mainFont1,
            ),
            onTap: onPressedEdit,
          ),
        ),
        Container(
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
      ],
    );
  }
}
