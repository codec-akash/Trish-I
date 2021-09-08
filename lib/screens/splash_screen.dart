import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trishi/global/global.dart';
import 'package:trishi/screens/bmi_page.dart';
import 'package:trishi/screens/home_screen.dart';
// import 'package:trishi/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Future.delayed(Duration(seconds: 2)).then((value) async {
      SharedPreferences _preferences = await SharedPreferences.getInstance();
      if (_preferences.containsKey(Global.BMIDataKey)) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => BmiEntry(),
          ),
        );
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF017e6F),
        body: Center(
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            width: 300,
          ),
        ));
  }
}
