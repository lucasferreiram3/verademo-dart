import 'dart:async';

import 'package:flutter/material.dart';
import 'package:verademo_dart/controllers/blab_controller.dart';
import 'package:verademo_dart/model/User.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/widgets/feed_radio.dart';

class FeedPage extends StatefulWidget {

  final String username;

  FeedPage({super.key, required this.username});
  final controller = TextEditingController();

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  late Future<User> futureUser;
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // futureUser = getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: VConstants.pagePadding,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Welcome, ${widget.username}', 
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ],
              ),
            ),
            //Begin TextField Line
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.controller,
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
                  onPressed: () { 
                    setState(() {
                      BlabController.addBlab(widget.controller.text,context);
                }); },
                  child: const Text('Add'),
                ),
              ],
            ),
            // Spacer between Sections
            const SizedBox(height: 16),
        
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                child: const FeedRadio(),)),
            // const FeedRadio(),
            // More spacing
            const SizedBox(height: 16),
            
          ],
        ),
      ),
    );
  }

   
}