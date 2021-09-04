import 'package:flutter/material.dart';

Widget testTemplates(massageName) {
  return Card(
    margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$massageName',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
          )
        ],
      ),
    ),
  );
}

Widget newGrid() {
  return GridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 10.0,
    mainAxisSpacing: 10.0,
    shrinkWrap: true,
    children: List.generate(
      20,
      (index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('assets/back.svg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
          ),
        );
      },
    ),
  );
}

class BodypartCard extends StatelessWidget {
  const BodypartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Design body part card
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(8.0),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     testTemplates("Shoulder Massage"),
        //     testTemplates("Knee Massage"),
        //   ],
        // ),
        child: newGrid(),
      ),
    );
  }
}
