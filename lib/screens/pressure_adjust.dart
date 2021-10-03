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
  final Function sendData;
  const PressureAdjust(
      {Key? key,
      required this.imagePath,
      required this.bodyPart,
      required this.sendData})
      : super(key: key);

  @override
  _PressureAdjustState createState() => _PressureAdjustState();
}

class _PressureAdjustState extends State<PressureAdjust> {
  BMiModel? _bMiModel;
  bool isLoading = true;
  bool isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<BmiProvider>(context, listen: false)
          .fetchBMIData()
          .then((value) {
        setState(() {
          _bMiModel = Provider.of<BmiProvider>(context, listen: false).bmiData;
        });
      });
      setState(() {
        isLoading = false;
        isInit = false;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bodyPart),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
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
                    bmiValue: _bMiModel?.bmi ?? 21.5,
                    age: _bMiModel?.age ?? 21,
                    sendData: widget.sendData,
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
