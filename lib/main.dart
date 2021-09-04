import 'package:flutter/material.dart';
import 'package:trishi/screens/bmi_page.dart';
import 'package:trishi/screens/home_screen.dart';
import 'package:trishi/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trish - I',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BmiEntry(),
    );
  }
}
