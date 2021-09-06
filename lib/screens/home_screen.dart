import 'package:flutter/material.dart';
import '../widgets/body_part_card.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
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
                imagePath: 'assets/svgs/foot.svg',
                bodyPart: 'Foot',
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: BodypartCard(
                imagePath: 'assets/svgs/knees.svg',
                bodyPart: 'Knee',
              )),
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
