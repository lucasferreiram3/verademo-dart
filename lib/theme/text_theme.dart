import 'package:flutter/material.dart';

class VTextTheme {
  VTextTheme._();

  static TextTheme defaultTextTheme = TextTheme(
    titleMedium: const TextStyle().copyWith(fontSize: 40, fontWeight: FontWeight.w700),
    headlineLarge: const TextStyle().copyWith(fontSize: 32, fontWeight: FontWeight.w700),
    headlineMedium: const TextStyle().copyWith(fontSize: 20, fontWeight: FontWeight.w700),
    bodyMedium: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w400),
  );
}