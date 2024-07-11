import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';

class FeedRadio extends StatefulWidget {
  const FeedRadio({super.key});

  @override
  State<FeedRadio> createState() => _FeedRadioState();
}

class _FeedRadioState extends State<FeedRadio> {
  int currentSelect = 0;

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
                            onPressed: () {
                              setState(() {
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
                                currentSelect = 1;
                              }
                              );
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: (currentSelect==1) ? VConstants.veracodeBlue : VConstants.veracodeBlack),
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
