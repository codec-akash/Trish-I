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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //TODO: Call Body part card here
            Row(
              children: [
                BodypartCard()
              ],
            ),
            Row(
              children: [],
            ),
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
