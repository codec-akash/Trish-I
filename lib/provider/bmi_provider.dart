import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trishi/global/global.dart';
import 'package:trishi/model/body_model.dart';

class BmiProvider with ChangeNotifier {
  BMiModel? _bMiModel;
  late SharedPreferences _preferences;

  BMiModel? get bmiData => _bMiModel;

  Future<void> fetchBMIData() async {
    try {
      _preferences = await SharedPreferences.getInstance();
      String? bmiJson = _preferences.getString(Global.BMIDataKey);
      _bMiModel = BMiModel.fromJson(json.decode(bmiJson ?? ""));
    } catch (e) {}
  }
}
