import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trishi/global/global.dart';
import 'package:trishi/model/body_model.dart';
import 'package:trishi/repository/bmi_repo.dart';
import 'package:trishi/widgets/slider_widget.dart';

import 'home_screen.dart';

class BmiEntry extends StatefulWidget {
  const BmiEntry({Key? key}) : super(key: key);

  @override
  _BmiEntryState createState() => _BmiEntryState();
}

class _BmiEntryState extends State<BmiEntry> {
  final _formKey = GlobalKey<FormState>();
  late SharedPreferences _preferences;
  late BMiModel _userBmiData;

  Map<String, dynamic> userData = {};

  List<String> heightMap = ['m', 'cm', 'ft'];
  List<String> weightMap = ['kg', 'lb'];

  BmiRepo _bmiRepo = BmiRepo();

  bool isLoaded = false;

  late String heightDropdown = heightMap[0];
  late String weightDropDown = weightMap[0];
  late double? givenHeight = 0.0;
  late double? givenWeight = 0.0;

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
      weight = _bmiRepo.calculateWeight(
          weight: givenWeight!, weightUnit: weightDropDown);
      height = _bmiRepo.calculateHeight(
          height: givenHeight!, heightUnit: heightDropdown);
      bmi = _bmiRepo.calculateBMI(height: height!, weight: weight!);

      print(bmi);

      userData = {
        "age": age,
        "weight": weight,
        "height": height,
        "bmi": bmi,
        "height_unit": heightDropdown,
        "weight_unit": weightDropDown,
        "given_height": givenHeight,
        "given_weight": givenWeight
      };

      String userJson = json.encode(userData);

      _preferences.setString(Global.BMIDataKey, userJson);

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  void didChangeDependencies() async {
    _preferences = await SharedPreferences.getInstance();
    if (!isLoaded) {
      if (_preferences.containsKey(Global.BMIDataKey)) {
        setState(() {
          String userJson = _preferences.getString(Global.BMIDataKey) ?? '';
          userData = jsonDecode(userJson);
          _userBmiData = BMiModel.fromJson(userData);
          age = _userBmiData.age;
          weight = _userBmiData.weight;
          height = _userBmiData.height;
          bmi = _userBmiData.bmi;
          isLoaded = true;
          givenHeight = _userBmiData.givenHeight;
          givenWeight = _userBmiData.givenWeight;
          weightDropDown = _userBmiData.weightUnit;
          heightDropdown = _userBmiData.heightUnit;
        });
      }
      setState(() {
        isLoaded = true;
      });
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
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: Global().screenPadding,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            initialValue: givenHeight?.toString(),
                            decoration: InputDecoration(
                              labelText: "Enter Height",
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
                                givenHeight = double.tryParse(value) ?? 0.0;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 1.0,
                              horizontal: 5.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: Global().borderRadius15,
                            ),
                            child: DropdownButton(
                              value: heightDropdown,
                              items: heightMap.map((val) {
                                return DropdownMenuItem(
                                  child: Text(val),
                                  value: val,
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  heightDropdown = val.toString();
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            // initialValue: userData['weight']?.toString(),
                            initialValue: givenWeight?.toString(),
                            decoration: InputDecoration(
                              labelText: "Enter Weight",
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
                                givenWeight = double.tryParse(value) ?? 0.0;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 1.0,
                              horizontal: 5.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: Global().borderRadius15,
                            ),
                            child: DropdownButton(
                              value: weightDropDown,
                              items: weightMap.map((val) {
                                return DropdownMenuItem(
                                  child: Text(val),
                                  value: val,
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  weightDropDown = val.toString();
                                });
                              },
                            ),
                          ),
                        )
                      ],
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
                        padding: EdgeInsets.symmetric(vertical: 15),
                        margin: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 1.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Your BMI is: \n ${bmi?.toStringAsFixed(3)}",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          // color: Color(0xFFF7F5C9),
                          borderRadius: Global().borderRadius15,
                        ),
                      ),
                    Spacer(),
                    InkWell(
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
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
