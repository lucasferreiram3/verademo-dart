import 'package:flutter/material.dart';
import 'package:verademo_dart/internal_controller.dart';
import 'package:verademo_dart/utils/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242626),

      body: Column (
        children: [
          const SizedBox(height: 235),
          _credField('Username', context),
          const SizedBox(height: 17),
          _credField('Password', context),
          const SizedBox(height: 42),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 33),
            child: ElevatedButton(
              // style: TextButton.styleFrom(
              //   backgroundColor: const Color(0xff00B3E6)
              // ),
              
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor: const WidgetStatePropertyAll(VConstants.veracodeBlue),
                
              ),
              child: const Text('Login'),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage(username: 'test')),);
              },
            ),
          ),
        ],
      )
    );
  }

  Container _credField(String placeholder, BuildContext context) {
    return Container(
          // height: 40,
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 33),
          child: TextField (
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              hintText: placeholder,
              // hintStyle: const TextStyle(
              //   color: Color(0xffF4F4F4),
              //   fontSize: 20,
              // ),
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: VConstants.veracodeWhite),
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