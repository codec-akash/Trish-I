import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trishi/global/global.dart';
import 'package:trishi/screens/pressure_adjust.dart';

class BodypartCard extends StatelessWidget {
  final String imagePath;
  final String bodyPart;
  final Function sendData;
  const BodypartCard({
    Key? key,
    required this.imagePath,
    required this.bodyPart,
    required this.sendData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PressureAdjust(
                  imagePath: imagePath,
                  bodyPart: bodyPart,
                  sendData: sendData,
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
                  width: 100,
                  height: 100,
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "$bodyPart Massage",
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
