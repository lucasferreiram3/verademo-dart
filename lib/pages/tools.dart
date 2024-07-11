import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({super.key, required String username});

  @override
  ToolsPageState createState() => ToolsPageState();
  
}

class ToolsPageState extends State<ToolsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
        //crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Ping:\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: VConstants.codeWhite
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
              decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              hintText: 'Enter Hostname/IP',
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
             const SizedBox(width: 18,),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Ping'),
                ),
                
            ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 40,
              width: 240,
              child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Fortune'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Riddles'),
                            
                          ),
                        ),
                        
                      ],
                    ),
            ), 
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded( // TODO: Implement Populating of fortune/riddles within this container
          child: Container( 
            color : VConstants.darkNeutral2,
        ),

        ),
      ],
      ),
      ),
    );

  }
}