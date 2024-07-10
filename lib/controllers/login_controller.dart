import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verademo_dart/utils/shared_prefs.dart';

class LoginController {
  final username = TextEditingController();
  final password = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool rememberMe = false;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  Future<void> processLogin() async {
    try {
      if (!loginFormKey.currentState!.validate()) {
        return;
      }

      if (rememberMe) {
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('remembered_username', username.text.trim());
        await prefs.setString('remembered_password', password.text.trim());
      }

      // TODO: login stuff

    } catch (err) {
      print(err);
    }
  }
}
