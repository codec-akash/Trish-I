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
            activeColor: Theme.of(context).primaryColor,
            min: 0,
            max: 80,
            divisions: 8,
            label: "$_value",
            onChanged: (double value) {
              setState(() {
                _value = value.round();
              });
            },
          )),
    );
  }
}
