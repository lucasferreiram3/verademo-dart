import 'package:flutter/material.dart';
import 'package:verademo_dart/theme/text_field_theme.dart';
import 'package:verademo_dart/theme/checkbox_theme.dart';
import 'package:verademo_dart/theme/elevated_button_theme.dart';
import 'package:verademo_dart/theme/text_theme.dart';
import 'package:verademo_dart/utils/constants.dart';

class VTheme {
  VTheme._();

  static ThemeData defaultTheme = ThemeData (
    useMaterial3: true,
    fontFamily: 'Lato',
    brightness: Brightness.dark,
    primaryColor: VConstants.veracodeBlue,
    scaffoldBackgroundColor: VConstants.darkNeutral1,
    textTheme: VTextTheme.defaultTextTheme,
    elevatedButtonTheme: VElevatedButtonTheme.defaultElevatedButtonTheme,
  );

  static ThemeData loginTheme = ThemeData (
    useMaterial3: true,
    fontFamily: 'Lato',
    brightness: Brightness.dark,
    primaryColor: VConstants.veracodeBlue,
    scaffoldBackgroundColor: VConstants.veracodeBlack,
    textTheme: VTextTheme.defaultTextTheme,
    elevatedButtonTheme: VElevatedButtonTheme.loginElevatedButtonTheme,
    checkboxTheme: VCheckboxTheme.loginCheckboxTheme,
    inputDecorationTheme: VTextFormFieldTheme.loginTextFormTheme,
  );
}