import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final double bmiValue;
  final int age;
  const SliderWidget({Key? key, required this.bmiValue, required this.age})
      : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int _value = 0;

  int freqCheck(String? bmiStatus, int? age) {
    if (bmiStatus == 'Underweight') {
      if ((age! >= 20) && (age <= 50)) {
        return 40;
      } else if ((age >= 51) && (age <= 60)) {
        return 30;
      } else if ((age >= 61) && (age <= 90)) {
        return 20;
      }
    } else if (bmiStatus == 'Normal') {
      if ((age! >= 20) && (age <= 50)) {
        return 50;
      } else if ((age >= 51) && (age <= 60)) {
        return 40;
      } else if ((age >= 61) && (age <= 90)) {
        return 30;
      }
    } else if (bmiStatus == 'Overweight') {
      if ((age! >= 20) && (age <= 60)) {
        return 50;
      } else if ((age >= 61) && (age <= 70)) {
        return 40;
      } else if ((age >= 71) && (age <= 90)) {
        return 30;
      }
    } else if (bmiStatus == 'Obese') {
      if ((age! >= 20) && (age <= 60)) {
        return 60;
      } else if ((age >= 61) && (age <= 70)) {
        return 50;
      } else if ((age >= 71) && (age <= 80)) {
        return 40;
      } else if ((age >= 81) && (age <= 90)) {
        return 30;
      }
    }
    return 20;
  }

  void getBmi(double? bmiValue, int? age) {
    print(bmiValue);
    print(age);
    String? bmiStatus;
    if (bmiValue! < 18.5) {
      print('Underweight');
      bmiStatus = 'Underweight';
    } else if (bmiValue >= 18.5 && bmiValue < 25) {
      print('Normal');
      bmiStatus = 'Normal';
    } else if (bmiValue >= 25 && bmiValue < 30) {
      print('Overweight');
      bmiStatus = 'Overweight';
    } else if (bmiValue >= 30) {
      print('Obese');
      bmiStatus = 'Obese';
    }
    print('Freq: ${freqCheck(bmiStatus, age)}');
    _value = freqCheck(bmiStatus, age);
  }

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
