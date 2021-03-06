import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trishi/provider/bmi_provider.dart';
import 'package:trishi/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: BmiProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trish - I',
        theme: ThemeData(
          primaryColor: Color(0xFF017e6F),
          accentColor: Color(0xFFd9c562),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
