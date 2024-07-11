import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({super.key});

  @override
  ToolsPageState createState() => ToolsPageState();
  
}

class ToolsPageState extends State<ToolsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
        //crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Ping:\n',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: VConstants.codeWhite
            ),
          ),
        ),
          TextField(
            decoration: InputDecoration(
              filled: true,
              //border: const OutlineInputBorder(),
              hintText: 'Enter Hostname/IP',
              hintStyle: const TextStyle(
               fontSize: 14,
               //fontWeight: FontWeight.bold,
               color: VConstants.lightNeutral2
              ),
              
              suffixIcon: IconButton(
                onPressed: () {}, // TODO: Implement ClearText from InputDecoration

              icon: const Icon(Icons.clear),
              ),
               
            ),
            
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {}, // TODO : Implement Ping Function to be called (AKA Shell Command under the hood)
                style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Ping'),
            ),
            ],
          ),
        ],
      ),
      ),
    );

  }
}