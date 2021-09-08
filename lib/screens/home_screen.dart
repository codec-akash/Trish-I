import 'package:flutter/material.dart';
import '../widgets/body_part_card.dart';
// import 'package:trishi/global/global.dart';
import 'bmi_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trish - I"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        child: Container(
          height: 50,
          // padding: EdgeInsets.symmetric(vertical: 20.0),
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8),
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
