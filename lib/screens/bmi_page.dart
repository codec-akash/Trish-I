import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trishi/global/global.dart';
import 'package:trishi/repository/bmi_repo.dart';

import 'home_screen.dart';

class BmiEntry extends StatefulWidget {
  const BmiEntry({Key? key}) : super(key: key);

  @override
  _BmiEntryState createState() => _BmiEntryState();
}

class _BmiEntryState extends State<BmiEntry> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> userData = {};

  BmiRepo _bmiRepo = BmiRepo();

  bool isLoaded = false;

  int age = 0;

  double? height;
  double? weight;
  double? bmi;

  bool validateAge(int? age) {
    if (age != null) {
      if (age <= 0 || age > 110) {
        return false;
      }
      return true;
    }
    return false;
  }

  void submitButton() async {
    var isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      bmi = _bmiRepo.calculateBMI(height: height!, weight: weight!);

      print(bmi);

      userData = {
        "age": age,
        "weight": weight,
        "height": height,
        "bmi": bmi,
      };

      String userJson = json.encode(userData);

      SharedPreferences _preferences = await SharedPreferences.getInstance();

      _preferences.setString(Global.BMIDataKey, userJson);

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  void didChangeDependencies() async {
    if (!isLoaded) {
      SharedPreferences _preferences = await SharedPreferences.getInstance();
      if (_preferences.containsKey(Global.BMIDataKey)) {
        setState(() {
          String userJson = _preferences.getString(Global.BMIDataKey) ?? '';
          userData = jsonDecode(userJson);
          age = userData["age"];
          weight = userData['weight'];
          height = userData['height'];
          bmi = userData['bmi'];
          isLoaded = true;
        });
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculation"),
      ),
      body: !isLoaded
          ? Container(
              width: double.infinity,
              height: double.infinity,
              child: CircularProgressIndicator())
          : Container(
              padding: Global().screenPadding,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: userData['height']?.toString(),
                      decoration: InputDecoration(
                        labelText: "Enter Height(meter)",
                        border: OutlineInputBorder(
                          borderSide: Global().textFieldBorderSide,
                          borderRadius: Global().borderRadius15,
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
                      onChanged: (value) {
                        setState(() {
                          height = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      initialValue: userData['weight']?.toString(),
                      decoration: InputDecoration(
                        labelText: "Enter Weight(Kg)",
                        border: OutlineInputBorder(
                          borderSide: Global().textFieldBorderSide,
                          borderRadius: Global().borderRadius15,
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
                      onChanged: (value) {
                        setState(() {
                          weight = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      initialValue: userData['age']?.toString(),
                      decoration: InputDecoration(
                        labelText: "Enter Age",
                        border: OutlineInputBorder(
                          borderSide: Global().textFieldBorderSide,
                          borderRadius: Global().borderRadius15,
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
                      onChanged: (value) {
                        setState(() {
                          age = int.tryParse(value) ?? 0;
                        });
                      },
                    ),
                    if (bmi != null)
                      Container(
                        // height: double.infinity,
                        // width: double.infinity,
                        child: Text(bmi.toString()),
                      ),
                    Spacer(),
                    InkWell(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        margin: EdgeInsets.symmetric(horizontal: 15.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: Global().borderRadius15,
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
