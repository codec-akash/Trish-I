import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trishi/global/global.dart';
import 'package:trishi/screens/pressure_adjust.dart';

class BodypartCard extends StatelessWidget {
  final String imagePath;
  final String bodyPart;
  const BodypartCard({
    Key? key,
    required this.imagePath,
    required this.bodyPart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PressureAdjust(
                  imagePath: imagePath,
                  bodyPart: bodyPart,
                )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: Global().borderRadius15,
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: SvgPicture.asset(
                  imagePath,
                  height: 100,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                bodyPart,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
