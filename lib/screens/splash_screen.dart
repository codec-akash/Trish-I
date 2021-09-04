import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Color(0xFF017e6F),
          body:Center(
              child: Image(
                image: AssetImage('assets/images/logo.png'),
                width: 300,
              ),
          )
      );
  }
}
