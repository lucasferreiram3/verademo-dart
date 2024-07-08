import 'package:flutter/material.dart';
import 'package:verademo_dart/theme/text_theme.dart';

class VElevatedButtonTheme {
  VElevatedButtonTheme._();

  static final defaultElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      textStyle: VTextTheme.defaultTextTheme.bodyMedium,
      padding: const EdgeInsets.symmetric(vertical: 10.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    )
  );
}