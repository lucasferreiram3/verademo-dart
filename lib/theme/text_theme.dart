import 'package:flutter/material.dart';

class VTextTheme {
  VTextTheme._();

  static TextTheme defaultTextTheme = TextTheme(
    titleMedium: const TextStyle().copyWith(fontSize: 48, fontWeight: FontWeight.w700),
    headlineLarge: const TextStyle().copyWith(fontSize: 38, fontWeight: FontWeight.w700),
    headlineMedium: const TextStyle().copyWith(fontSize: 20, fontWeight: FontWeight.w700),
    headlineSmall: const TextStyle().copyWith(fontSize: 15, fontWeight: FontWeight.w700),
    bodyLarge: const TextStyle().copyWith(fontSize: 20, fontWeight: FontWeight.w400),
    bodyMedium: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w400),
    labelMedium: const TextStyle().copyWith(fontSize: 20, fontWeight: FontWeight.w400),
    labelSmall: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w400),
    
  );
}