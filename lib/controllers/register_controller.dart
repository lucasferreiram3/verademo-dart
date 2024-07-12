import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verademo_dart/pages/register-finish.dart';

class RegisterController {
  final username = TextEditingController();
  final password = TextEditingController();
  final cpassword = TextEditingController();
  final realName = TextEditingController();
  final blabName = TextEditingController();

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerFinishFormKey = GlobalKey<FormState>();

  void processRegister(BuildContext context) async {
    try {
      // Validate form
      if (!registerFormKey.currentState!.validate()) {
        return;
      }

      // TODO: Check if username already exists

      Navigator.push(context,
                     MaterialPageRoute(builder: (context) => RegisterFinishPage(controller: this)),);

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
