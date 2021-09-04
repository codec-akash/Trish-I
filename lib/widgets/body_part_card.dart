import 'package:flutter/material.dart';

Widget gridCard(massageName) {
  return Card(
    margin: EdgeInsets.all(5.0),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 150,
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 110,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  height: 110,
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              '$massageName',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class BodypartCard extends StatelessWidget {
  const BodypartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Design body part card
    return Container(
        margin: EdgeInsets.all(8.0),
        // child: newGrid(),
        child: gridCard("Body"));
  }
}
