import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/controllers/internal_controller.dart';
import 'package:verademo_dart/utils/shared_prefs.dart';
import 'package:http/http.dart' as http;

class LoginController {
  final username = TextEditingController();
  final password = TextEditingController();
  bool rememberMe = false;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void processLogin(BuildContext context) async {
    try {
      // Validate Form
      if (!loginFormKey.currentState!.validate()) {
        return;
      }

      // Build API call for login
      print("Building API call to /users/login/");
      const url = "${VConstants.apiUrl}/users/login/";
      final uri = Uri.parse(url);
      final body = jsonEncode(<String, String> {
        "username": username.text,
        "password": password.text
      });
      final Map<String, String> headers = {
        "content-type": "application/json",
        "Authorization": "Token: ${md5.convert(utf8.encode(password.text)).toString()}"
      };

      // Execute API call for login
      final response = await http.post(uri, body: body, headers: headers);

      if (response.statusCode == 200) {
        // Login successful
        print(response.body);

        // Make sure context exists
        if (!context.mounted) return;

        // TODO: Save login information with remember me
        if (rememberMe) {
          VSharedPrefs().rememberedUsername = username.text;
          VSharedPrefs().rememberedPassword = password.text;
          VSharedPrefs().username = username.text;
        }

        // Use pushReplacement to prevent back button from going back to login page once logged in
        // TODO: Find a way to make back button trigger logout instead?
        Navigator.pushReplacement(context,
                       MaterialPageRoute(builder: (context) => HomePage(username: username.text)),);
      } else {
        // Login failed
        print(response.body);
      }
    } catch (err) {
      print(err);
    }
  }
}
