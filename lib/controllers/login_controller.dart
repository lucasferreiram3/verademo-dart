import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  final username = TextEditingController();
  final password = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool rememberMe = false;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void processLogin() async {
    try {
      // Validate Form
      if (!loginFormKey.currentState!.validate()) {
        return;
      }

      // TODO: Save login information with remember me
      if (rememberMe) {
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('remembered_username', username.text.trim());
        await prefs.setString('remembered_password', password.text.trim());
      }

      // TODO: 

      

    } catch (err) {
      print(err);
    }
  }
}
