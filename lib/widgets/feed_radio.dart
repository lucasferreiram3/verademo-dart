import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/widgets/feed_list.dart';
import 'package:verademo_dart/widgets/myblabs_list.dart';

// enum type for switching between containers on same page
enum WidgetState {
  Feed, MyBlabs
}

class FeedRadio extends StatefulWidget {
  const FeedRadio({super.key});

  @override
  State<FeedRadio> createState() => _FeedRadioState();
}

class _FeedRadioState extends State<FeedRadio> {
  WidgetState currentWidget = WidgetState.Feed;
  int currentSelect = 0;

  @override
  Widget build(BuildContext context) {
    return Column( 
                  children: [ SizedBox(
                    height: 40,
                    width: 240,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentWidget = WidgetState.Feed;
                                currentSelect = 0;
                              });
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: (currentSelect==0) ? VConstants.veracodeBlue : VConstants.veracodeBlack),
                            child: const Text('Feed'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentWidget = WidgetState.MyBlabs;
                                currentSelect = 1;
                              }
                              );
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: (currentSelect==1) ? VConstants.veracodeBlue : VConstants.veracodeBlack),
                            child: const Text('My Blabs'),
                            
                          ),
                          
                        ), 
                        const SizedBox(width: 16),
                        
                      ],
                    ),
                  ),
                  Container(child: getContainer())
                  ],
                   
              );
  }
  Widget getContainer() {
    switch (currentWidget) {
      case WidgetState.Feed:
      ListView.builder();
        return FeedList(message: 'Message', user: 'Username', time: 'Time');
      case WidgetState.MyBlabs:
        return MyBlabs();
    }
  }
}
