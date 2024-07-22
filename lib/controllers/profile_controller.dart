import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/utils/shared_prefs.dart';

class ProfileController {
  final realName = TextEditingController();
  final blabName = TextEditingController();
  final username = TextEditingController();
  List hecklers = [];
  List events = [];
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
        events = data['events'];
        hecklers = data['hecklers'];

      }
    } catch (err) {
      print(err);
    }


  }

  updateEvents(String username, callback) async {
    try {
      // Build API call for getProfileInfo
      print("Building API call to /users/getEvents/");
      const url = "${VConstants.apiUrl}/users/getEvents/";
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
        events = data;
        return callback(events);
      }
      else{
        return callback(["Bad Response"]);
      }
    } catch (err) {
      return callback(["error occurred"]);
    }


  }

}
