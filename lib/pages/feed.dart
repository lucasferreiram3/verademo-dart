import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';

class FeedPage extends StatefulWidget {

  final String username;

  const FeedPage({super.key, required this.username});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VConstants.darkNeutral1,
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Expanded(child: Text(
                      'Welcome, ${widget.username}', 
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineLarge,
                      ),),
                  ],
                ),
              ),
              //Begin TextField Line
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
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
                  const SizedBox(width: 8,),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add'),
                  ),
                ],
              ),
              // Spacer between Sections
              const SizedBox(height: 16),
              const FeedRadio(),
              // Feed and MyBlabs buttons
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     SizedBox(
              //       height: 40,
              //       width: 240,
              //       child: Row(
              //         children: [
              //           Expanded(
              //             child: ElevatedButton(
              //               onPressed: () {},
              //               child: const Text('Feed'),
              //             ),
              //           ),
              //           const SizedBox(width: 16),
              //           Expanded(
              //             child: ElevatedButton(
              //               onPressed: () {},
              //               child: const Text('My Blabs'),
                            
              //             ),
              //           ),
                        
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // More spacing
              const SizedBox(height: 16),
              
              // Main Blabs Container
              Expanded(
                child: Container(
                  color:  VConstants.darkNeutral2,
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

enum SingingCharacter { feed, blabs }

class FeedRadio extends StatefulWidget {
  const FeedRadio({super.key});

  @override
  State<FeedRadio> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<FeedRadio> {

  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    width: 240,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Feed'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('My Blabs'),
                            
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ],
              );
  }
}
