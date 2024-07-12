import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/widgets/feed_blab.dart';
import 'package:verademo_dart/widgets/feed_radio.dart';

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
              // More spacing
              const SizedBox(height: 16),
              
              // Main Blabs Container
              Expanded(
                child: Container(
                  color:  VConstants.darkNeutral2,
                  child: const FeedBlabs(['Kevin','Brian','Johnny','Stuart','Clyde','Kevin','Stuart','Clyde','Kevin','Stuart','Clyde','Kevin','Stuart','Clyde'])
                  
                  /*const Center(
                    child: Text(
                      'No Blabs yet...',
                      style: TextStyle(color: VConstants.codeWhite),
                    ),
                  ),*/
                ),
              ),
            ],
          ),
        ),
    );
  }
}