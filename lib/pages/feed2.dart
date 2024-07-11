import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';

class BlabPage extends StatelessWidget {
  const BlabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VConstants.darkNeutral1,
      appBar: AppBar(
        backgroundColor: VConstants.codeBlack,
        elevation: 0,
        title: const Text('Hello, <username>'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Blab something now...',
                      filled: true,
                      fillColor: VConstants.darkNeutral2,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  ),
                  child: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  ),
                  child: const Text('Feed'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  ),
                  child: const Text('My Blabs'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                color: Colors.grey[800],
                child: Center(
                  child: Text(
                    'No Blabs yet...',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
