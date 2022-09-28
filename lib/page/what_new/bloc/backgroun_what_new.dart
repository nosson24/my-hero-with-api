import 'package:flutter/material.dart';

class BackgrounWhatNew extends StatelessWidget {
  const BackgrounWhatNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/backgroun_what_new.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.transparent,
                const Color(0xff161d27).withOpacity(0.2),
                const Color(0xff161d27).withOpacity(0.4),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
