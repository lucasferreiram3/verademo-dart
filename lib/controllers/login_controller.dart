import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/controllers/internal_controller.dart';
import 'package:verademo_dart/utils/shared_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:verademo_dart/utils/snackbar.dart';

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

        // Save login information with remember me
        if (rememberMe) {
          VSharedPrefs().rememberedUsername = username.text;
          VSharedPrefs().rememberedPassword = password.text;
        }

        // Set session username
        VSharedPrefs().username = username.text;

        // Use pushReplacement to prevent back button from going back to login page once logged in
        // TODO: Find a way to make back button trigger logout instead?
        Navigator.pushReplacement(context,
                       MaterialPageRoute(builder: (context) => HomePage(username: username.text)),);
      } else if (response.statusCode == 403) {
        // Login credentials incorrect
        final data = json.decode(response.body)["data"];
        print(data);
        if (!context.mounted) return;
        
        ScaffoldMessenger.of(context).showSnackBar(VSnackBar.errorSnackBar("Username or password incorrect."));
      } else {
         // Login failed
        final data = json.decode(response.body)["data"];
        print(data);
        if (!context.mounted) return;
        
        ScaffoldMessenger.of(context).showSnackBar(VSnackBar.errorSnackBar(data));
 
      }
    } catch (err) {
      print(err);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(VSnackBar.errorSnackBar(err));
    }
  }
}
