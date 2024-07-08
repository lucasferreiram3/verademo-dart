import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242626),
      body: Column (
        children: [
          const SizedBox(height: 235),
          _credField('Username'),
          const SizedBox(height: 17),
          _credField('Password'),
          const SizedBox(height: 42),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xff00B3E6)
            ),
            child: const Text('Login'),
            onPressed: () {
              print('pressed login');
            },
          ),
        ],
      )
    );
  }

  Container _credField(placeholder) {
    return Container(
          // height: 40,
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 33),
          child: TextField (
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              hintText: placeholder,
              hintStyle: const TextStyle(
                color: Color(0xffF4F4F4),
                fontSize: 20,
              ),
              filled: true,
              fillColor: const Color(0xff454443),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              )
        
            )
          )
        );
  }
}