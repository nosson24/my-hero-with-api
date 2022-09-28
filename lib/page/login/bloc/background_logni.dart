import 'package:flutter/material.dart';

class BackgroundLogin extends StatefulWidget {
  const BackgroundLogin({Key? key}) : super(key: key);

  @override
  State<BackgroundLogin> createState() => _BackgroundLoginState();
}

class _BackgroundLoginState extends State<BackgroundLogin> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/login_myhero.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    const Color(0xff161d27).withOpacity(0.8),
                    const Color(0xff161d27),
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
