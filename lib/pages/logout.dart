import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color : VConstants.darkNeutral1,
          borderRadius: BorderRadius.circular(10),
        ),
        child : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
              // ignore: prefer_const_constructors
              Text('Would you like to logout?\n',
              textAlign: TextAlign.center,
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: VConstants.veracodeWhite,
                fontSize: 28,
                fontWeight: FontWeight.bold, 
              ),
              ),
              // spacing purposes
              // ignore: prefer_const_constructors
              
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffEC5B5B),
                    ),
                    onPressed: () {}, // TODO: Implement LogoutController trigger event
                    child: const Text(
                      'Yes, Log me out!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: VConstants.veracodeBlue,
                    ),
                    onPressed: () {}, // TODO: Implement LogoutController trigger event
                    child: const Text(
                      'No, More Blab!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ), 
          ],
        ),
      ),
    );
  }
}