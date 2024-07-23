import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/utils/shared_prefs.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:verademo_dart/utils/snackbar.dart';

class BlabController {
  final blabPost = TextEditingController();
  final commentPost = TextEditingController();

  void addBlab(context) async {
    try {
      print("Building API call to /posts/addBlab/");
      const url = "${VConstants.apiUrl}/posts/addBlab/";
      final uri = Uri.parse(url);
      final body = jsonEncode(<String, String> {
        "blab": blabPost.text
      });
      final Map<String, String> headers = {
        "content-type": "application/json",
        "Authorization": VSharedPrefs().token ?? "",
      };

      // Execute API call for addBlab/
      final response = await http.post(uri, headers: headers, body: body);
      print("Executed API call to addBlab");

      if (response.statusCode == 200) {
        print(response.body);
        blabPost.text = "";

        // TODO: Update My Blabs
      } else {
        ScaffoldMessenger.of(context).showSnackBar(VSnackBar.errorSnackBar("Post failed."));
      }
    } catch (err) {
      print(err);
      ScaffoldMessenger.of(context).showSnackBar(VSnackBar.errorSnackBar("Post failed."));
    }
  }

  void addBlabComment(int blabId, BuildContext context) async {
    try {
      print("Building API call to /posts/addBlabComment/");
      const url = "${VConstants.apiUrl}/posts/addBlabComment/";
      final uri = Uri.parse(url);
      final body = jsonEncode(<String, dynamic> {
        "blabId": blabId,
        "comment": commentPost.text,
      });
      final Map<String, String> headers = {
        "content-type": "application/json",
        "Authorization": VSharedPrefs().token ?? "",
      };

      // Execute API call for addBlabComment/
      final response = await http.post(uri, headers: headers, body: body);
      print("Executed API call to addBlabComment");

      if (response.statusCode == 200) {
        print(response.body);

        // TODO: Update My Blabs and Feed
      } else {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(VSnackBar.errorSnackBar("Post failed."));
      }
    } catch (err) {
      print(err);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(VSnackBar.errorSnackBar("Post failed."));
    }
  }

  

}
