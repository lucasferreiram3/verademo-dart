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

}
