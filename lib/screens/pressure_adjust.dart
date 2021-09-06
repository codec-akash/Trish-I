import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trishi/global/global.dart';

class PressureAdjust extends StatefulWidget {
  final String imagePath;
  final String bodyPart;
  const PressureAdjust(
      {Key? key, required this.imagePath, required this.bodyPart})
      : super(key: key);

  @override
  _PressureAdjustState createState() => _PressureAdjustState();
}

class _PressureAdjustState extends State<PressureAdjust> {
  int _value = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bodyPart),
      ),
      body: Container(
        padding: Global().screenPadding,
        child: Column(
          children: [
            SvgPicture.asset(
              widget.imagePath,
              height: 110,
            ),
            Flexible(
                flex: 1,
                child: Slider(
                  value: _value.toDouble(),
                  max: 20,
                  min: 0,
                  onChanged: (double value) {
                    setState(() {
                      _value = value.round();
                    });
                  },
                )),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "1. This is Information 1 which can be provided for this specific bofy part",
                        style: TextStyle(
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "2. This is Information 1 which can be provided for this specific bofy part",
                        style: TextStyle(
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
