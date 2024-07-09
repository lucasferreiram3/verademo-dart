import 'package:flutter/material.dart';

// ignore: camel_case_types
class resetPopup extends StatelessWidget {
  const resetPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const resetWidget(),
            );
            // For testing pop-up functionality, will change to the top right corner. 
          }, child: const Text('Test Button'),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class resetWidget extends StatelessWidget {
  const resetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 25,
        ),
        decoration: const BoxDecoration(
          color : Color.fromARGB(255, 36, 38, 38),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ignore: prefer_const_constructors
            SizedBox(
              height: 28,
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                width: 20,
              ),
              // ignore: prefer_const_constructors
              Text('Confirm Reset',
              textAlign: TextAlign.center,
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold, 
              ),
              ),
              // ignore: prefer_const_constructors
              Text(
                'I realize that I will lose all data in my current VeraDemo instance, including users.',
                textAlign: TextAlign.center,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xffEC5B5B),
                      padding: const EdgeInsets.symmetric(
                        vertical: 0, 
                        horizontal: 140,
                      ),

                    ),
                    onPressed: () {},
                    child: const Text(
                      'Reset',
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