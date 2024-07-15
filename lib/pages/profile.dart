import 'package:flutter/material.dart';
import 'package:verademo_dart/controllers/profile_controller.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/utils/shared_prefs.dart';
import 'package:verademo_dart/widgets/credentials_field.dart';
import 'package:verademo_dart/widgets/user_field.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final username = VSharedPrefs().username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: VConstants.pagePadding,
          child: Column(
            children: [
              _updateProfileForm(),
              const SizedBox(height: VConstants.textFieldSpacingMed * 2),
              _hecklersButton(),
              const SizedBox(height: VConstants.textFieldSpacing / 2),
              _historyButton(),
            ],
          )
        )
      )
    );
  }

  SizedBox _historyButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("History"),
      ),
    );
  }

  SizedBox _hecklersButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Hecklers"),
      ),
    );
  }

  Form _updateProfileForm() {
    final controller = ProfileController();

    controller.username.text = VSharedPrefs().username ?? "";

    return Form(
      child: Column(
        children: [
          _profileImage(),
          const SizedBox(height: VConstants.textFieldSpacing * 2),
          VUserField("Real Name", controller: controller.realName),
          const SizedBox(height: VConstants.textFieldSpacingMed),
          VUserField("Blab Name", controller: controller.blabName),
          const SizedBox(height: VConstants.textFieldSpacingMed),
          VUserField("Username", controller: controller.username),
          const SizedBox(height: VConstants.textFieldSpacingMed),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Update Profile"),
            ),
          )
        ],
      ),
    );
  }

  Row _profileImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          foregroundImage: AssetImage('assets/images/$username.png'),
          backgroundImage: const AssetImage('assets/images/default_profile.png'),
          radius: 48,
        ),
        const SizedBox(width: 30),
        _profileImageActions()
      ]
    );
  }

  Expanded _profileImageActions() {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Change Profile Picture")
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Download Current Image")
            ),
          ),
        ]
      )
    );
  }
}