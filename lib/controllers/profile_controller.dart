import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/utils/shared_prefs.dart';
import 'package:http/http.dart' as http;

class ProfileController {
  final realName = TextEditingController();
  final blabName = TextEditingController();
  final username = TextEditingController();
  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  void setVariablesFromUsername(String username) async {
    try {
      // Build API call for getProfileInfo
      print("Building API call to /users/getProfileInfo/");
      const url = "${VConstants.apiUrl}/users/getProfileInfo/";
      final uri = Uri.parse(url);
      final Map<String, String> headers = {
        "Authorization": VSharedPrefs().token ?? "",
      };

      // Execute API call for getProfileInfo
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        // Query successful
        print(response.body);

        // Set variables
        final data = jsonDecode(response.body)["data"];
        realName.text = data["realName"];
        blabName.text = data["blabName"];
        this.username.text = data["username"];

      }
    } catch (err) {
      print(err);
    }


  }

}
