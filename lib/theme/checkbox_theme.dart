import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';

class VCheckboxTheme {
  VCheckboxTheme._();

  static CheckboxThemeData loginCheckboxTheme = CheckboxThemeData(
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return VConstants.veracodeWhite;
      } else {
        return Colors.blue;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.blue;
      } else {
        return VConstants.veracodeWhite;
      }
    }),
  );
}