import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trishi/global/global.dart';
import 'package:trishi/model/body_model.dart';
import 'package:trishi/provider/bmi_provider.dart';
import 'package:trishi/widgets/slider_widget.dart';

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
  BMiModel? _bMiModel;

  @override
  void didChangeDependencies() {
    Provider.of<BmiProvider>(context, listen: false)
        .fetchBMIData()
        .then((value) {
      setState(() {
        _bMiModel = Provider.of<BmiProvider>(context, listen: false).bmiData;
      });
    });
    super.didChangeDependencies();
  }

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
              width: 110,
              height: 110,
              color: Theme.of(context).primaryColor,
            ),
            SliderWidget(
              bmiValue: _bMiModel!.bmi,
              age: _bMiModel!.age,
            ),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "1. This is Information 1 which can be provided for this specific body part",
                        style: TextStyle(
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "2. This is Information 2 which can be provided for this specific body part",
                        style: TextStyle(
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "3. This is Information 3 which can be provided as precautions for this specific body part",
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
