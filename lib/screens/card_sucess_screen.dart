import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class slider extends StatefulWidget {
   const slider({Key? key}) : super(key: key);

   @override
   _sliderState createState() => _sliderState();
 }

 class _sliderState extends State<slider> {
   @override

   int _value=6;
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("loreum"),
       ),
       body: Column(
         children: [
           Flexible(
                flex: 1,
               child: Slider(
                 value: _value.toDouble(),
                 max: 20,
                 min: 0, onChanged: (double value) {
                   setState(()
                        {
                            _value=value.round();
                        }
                     );
                   },
               )
           ),


           Expanded(
             flex: 3,
              child:Container(
                  color: Colors.blueAccent,
                  child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(
                    fontSize: 22,
                    color:Colors.white,
                    fontStyle: FontStyle.italic
                  ),
                ),
              )
           ),

         ],
       ),
     );
   }
 }

