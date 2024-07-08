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
        decoration: const BoxDecoration(
          color : Color.fromARGB(255, 36, 38, 38),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child : const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 322,
              ),
              SizedBox(
                width: 286,
              ),
              Text('Confirm Reset',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                
              ),
              ),
              Text(
                'I realize that I will lose all data in my current VeraDemo instance, including users.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 46 ,
                ),
              SizedBox(
                width: 256,
              ),
              Row(children: [
                
              ],)
              
          ],
        )
      ),
    );
  }
}