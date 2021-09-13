import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trishi/global/global.dart';
import 'package:trishi/model/body_model.dart';
import 'package:trishi/provider/bmi_provider.dart';
import '../widgets/body_part_card.dart';
// import 'package:trishi/global/global.dart';
import 'bmi_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        title: Text("Trish - I"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        child: Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 15.0,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: Global().borderRadius15,
          ),
          alignment: Alignment.center,
          child: Text(
            "Update BMI",
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => BmiEntry()));
        },
      ),
      body: Column(
        children: [
          if (_bMiModel?.bmi != null)
            Container(
              padding: Global().screenPadding,
              margin: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Your BMI is: ${_bMiModel!.bmi.toStringAsFixed(3)}",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: Global().borderRadius15,
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: BodypartCard(
                imagePath: 'assets/svgs/back.svg',
                bodyPart: 'Back',
              )),
              Expanded(
                  child: BodypartCard(
                imagePath: 'assets/svgs/knees.svg',
                bodyPart: 'Knee',
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: BodypartCard(
                imagePath: 'assets/svgs/shoulder.svg',
                bodyPart: 'Shoulder',
              )),
            ],
          ),
        ],
      ),
    );
  }
}
