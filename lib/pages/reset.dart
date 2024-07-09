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
        child : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 32,
              ),
              const SizedBox(
                width: 28,
              ),
              const Text('Confirm Reset',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold, 
              ),
              ),
              const Text(
                'I realize that I will lose all data in my current VeraDemo instance, including users.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 46 ,
                ),
              const SizedBox(
                width: 25,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {}, child: const Text("TODO")),
                ],
              ),
              
          ],
        )
      ),
    );
  }
}