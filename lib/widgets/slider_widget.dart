import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int _value = 6;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
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
    );
  }
}
