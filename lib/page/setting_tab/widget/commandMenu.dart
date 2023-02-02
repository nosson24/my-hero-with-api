import 'package:flutter/material.dart';

class CommandMenu extends StatelessWidget {
  final VoidCallback? onPressed;
  final Text prefixText;
  final Widget? suffixWidget;
  const CommandMenu({
    Key? key,
    this.onPressed,
    required this.prefixText,
    this.suffixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Card(
            elevation: 5,
            child: Container(
              alignment: Alignment.center,
              height: 55,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    prefixText,
                    suffixWidget!,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
