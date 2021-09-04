import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trishi/global/global.dart';

class BmiEntry extends StatefulWidget {
  const BmiEntry({Key? key}) : super(key: key);

  @override
  _BmiEntryState createState() => _BmiEntryState();
}

class _BmiEntryState extends State<BmiEntry> {
  final _formKey = GlobalKey<FormState>();

  bool validateAge(int? age) {
    if (age != null) {
      if (age <= 0 || age > 110) {
        return false;
      }
      return true;
    }
    return false;
  }

  void submitButton() {
    var isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculation"),
      ),
      body: Container(
        padding: Global().screenPadding,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Height(meter)",
                  border: OutlineInputBorder(
                    borderSide: Global().textFieldBorderSide,
                    borderRadius: Global().textFieldBorderRadius,
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null) {
                    return "Enter Height!";
                  }
                  if (value.isEmpty) {
                    return "Height Cannot be empty";
                  }
                  double height = double.tryParse(value) ?? 0.0;
                  if (height <= 0.0) {
                    return "Enter a Valid Height";
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Weight(Kg)",
                  border: OutlineInputBorder(
                    borderSide: Global().textFieldBorderSide,
                    borderRadius: Global().textFieldBorderRadius,
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null) {
                    return "Enter Weight!";
                  }
                  if (value.isEmpty) {
                    return "Weight Cannot be empty";
                  }
                  double weight = double.tryParse(value) ?? 0.0;
                  if (weight <= 0.0) {
                    return "Enter a Valid Weight";
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Age",
                  border: OutlineInputBorder(
                    borderSide: Global().textFieldBorderSide,
                    borderRadius: Global().textFieldBorderRadius,
                  ),
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null) {
                    return "Enter Age!";
                  }
                  if (value.isEmpty) {
                    return "Age Cannot be empty";
                  }
                  if (!validateAge(int.tryParse(value))) {
                    return "Enter a valid Age";
                  }
                  return null;
                },
              ),
              Spacer(),
              InkWell(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: Global().buttonBorderRadius,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Calculate BMI",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onTap: () {
                  submitButton();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
