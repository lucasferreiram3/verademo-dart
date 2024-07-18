import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/controllers/internal_controller.dart';
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
      final body = jsonEncode(<String, String> {
        "username": this.username.text,
      });
      final Map<String, String> headers = {
        "content-type": "application/json",
        "Authorization": VSharedPrefs().token ?? "",
      };

      // Execute API call for getProfileInfo
      final response = await http.post(uri, body: body, headers: headers);
    } catch (err) {
      print(err);
    }


  }

}
