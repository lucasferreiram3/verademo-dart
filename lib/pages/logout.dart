import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color : VConstants.veracodeBlack,
          borderRadius: BorderRadius.circular(10),
        ),
        child : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
              // ignore: prefer_const_constructors
              Text('Are You Sure?\n',
              textAlign: TextAlign.center,
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: VConstants.veracodeWhite,
                fontSize: 24,
                fontWeight: FontWeight.bold, 
              ),
              ),
              // spacing purposes
              // ignore: prefer_const_constructors
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffEC5B5B),
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                    ),
                    onPressed: () {}, // TODO: Implement LogoutController trigger event
                    child: const Text(
                      'Yes, Log me out!',
                      style: TextStyle(
                        color: VConstants.veracodeWhite,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: VConstants.veracodeBlue,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                    ),
                    onPressed: () {}, // TODO: Implement redirect to home trigger event
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