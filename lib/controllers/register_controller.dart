import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verademo_dart/pages/register-finish.dart';
import 'package:http/http.dart' as http;

class RegisterController {
  final username = TextEditingController();
  final password = TextEditingController();
  final cpassword = TextEditingController();
  final realName = TextEditingController();
  final blabName = TextEditingController();
  String? errorMessage;

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerFinishFormKey = GlobalKey<FormState>();

  // Future<String?> _validateUsernameAvailable() async {
  //   try {
  //     print("Username is: ${username.text}");
  //     if (username.text.isEmpty) {
  //       return "Username is required.";
  //     }

  //     // Build API call for getUsers
  //     print("Building API call to /users/getUsers/");
  //     const url = "${VConstants.apiUrl}/users/getUsers/";
  //     final uri = Uri.parse(url);
  //     final Map<String, String> headers = {
  //       "content-type": "application/json",
  //       "Authorization": "Token: 21232F297A57A5A743894A0E4A801FC3"
  //     };

  //     // Execute API call for getUsers
  //     final response = await http.get(uri, headers: headers);

  //     if (response.statusCode == 200) {
  //       // getUsers successful
  //       print(response.body);

  //       // Convert output to JSON
  //       final data = jsonDecode(response.body)["data"];
  //       print(data);

  //       // Check if username already exists
  //       bool exists = data.where((user) => user['username'] == username.text).isNotEmpty;

  //       if (exists) {
  //         print("${username.text} is available.");
  //         return null;
  //       } else {
  //         return "${username.text} is taken";
  //       }

  //     } else {
  //       // Login failed
  //       return "API Call Failed";
  //     }
  //   } catch (err) {
  //     return err.toString();
  //   }
  // }

  void processRegister(BuildContext context) async {
    try {
      // Validate form
      if (!registerFormKey.currentState!.validate()) {
        return;
      }

      // Build API call for getUsers
      print("Building API call to /users/getUsers/");
      const url = "${VConstants.apiUrl}/users/getUsers/";
      final uri = Uri.parse(url);
      final Map<String, String> headers = {
        "content-type": "application/json",
        "Authorization": "Token: 21232F297A57A5A743894A0E4A801FC3"
      };

      // Execute API call for getUsers
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        // getUsers successful
        print(response.body);

        // Convert output to JSON
        final data = jsonDecode(response.body)["data"];
        print(data);

        // Check if username already exists
        bool exists = data.where((user) => user['username'] == username.text).isNotEmpty;
        print(exists);

        if (!exists) {
          print("Username '${username.text}' is available.");
        } else {
          errorMessage = "Username '${username.text}' is taken";
          registerFormKey.currentState!.validate();
          return;
        }

        // Make sure context exists
        if (!context.mounted) return;

        Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterFinishPage(controller: this)),);
      } else {
        // Login failed
        print(response.body);
      }

    } catch (err) {
      print(err);
    }
  }

  void processRegisterFinish() async {
    try {
      // Validate form
      if (!registerFinishFormKey.currentState!.validate()) {
        return;
      }

      // TODO: Save user data in database

      // TODO: Save user session


    } catch (err) {
      print(err);
    }
  }
}
