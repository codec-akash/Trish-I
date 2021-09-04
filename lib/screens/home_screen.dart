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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          //TODO: Call Body part card here
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [BodypartCard(), BodypartCard()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [BodypartCard(), BodypartCard()],
          ),
          // Row(
          //   children: [BodypartCard(), BodypartCard()],
          // )
        ],
      ),
    );
  }
}
