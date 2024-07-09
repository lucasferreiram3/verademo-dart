import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:verademo_dart/internal_controller.dart';
import 'package:verademo_dart/theme/theme.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: VTheme.loginTheme,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: VConstants.loginSpacing,
            child: Column (
              children: [
                const SizedBox(height: 150),
                loginTitle(context),
                const SizedBox(height: 10),
                Text("The home of witty one-liners", style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: VConstants.lightNeutral2)),
                const SizedBox(height: 58),
                Form(
                  child: Column(
                    children: [
                      _credField('Username', context),
                      const SizedBox(height: 17),
                      _credField('Password', context),
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (value) {}),
                          const Text("Remember me")
                        ],
                      ),
                      const SizedBox(height: 30),
                      loginButton(context),
                    ],
                  ),
                ),
                const SizedBox(height: 85),
                signUpText(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text signUpText(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        const TextSpan(text: "Don't have an account? "),
        TextSpan(
          text: "Sign Up",
          // style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.blue),
          style: const TextStyle(
            color: Colors.blue
          ),
          recognizer: TapGestureRecognizer()..onTap = () {
            print("Sign up");
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterPage()));
          }
        ),
      ]),
    );
  }

  Row loginTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          height: 48,
          image: AssetImage(VConstants.vcIcon)
        ),
        const SizedBox(width: 9.2),
        Text("Blab-a-Gag", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: VConstants.codeWhite)),
        const SizedBox(width: 4),
      ],
    );
  }

  ElevatedButton loginButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('Login'),
      onPressed: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => const HomePage(username: 'test')),);
      },
    );
  }

  TextFormField _credField(String placeholder, BuildContext context) {
    return TextFormField (
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: VConstants.textFieldPadding,
        hintText: placeholder,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: VConstants.veracodeWhite),
        filled: true,

        fillColor: VConstants.darkNeutral1,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}