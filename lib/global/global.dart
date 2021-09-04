import 'package:flutter/material.dart';

class Global {
  BorderRadius textFieldBorderRadius = BorderRadius.circular(15.0);
  BorderRadius buttonBorderRadius = BorderRadius.circular(15.0);

  BorderSide textFieldBorderSide = BorderSide(
    color: Colors.white,
    width: 2.0,
  );

  EdgeInsetsGeometry screenPadding =
      EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0);
}
