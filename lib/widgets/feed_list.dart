import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/widgets/comment_widget.dart';
import 'package:verademo_dart/widgets/profile_image.dart';

class FeedList extends StatefulWidget {
  final String message;
  final String user;
  final String time;

  const FeedList({super.key, required this.message, required this.user, required this.time});

  @override
  State<FeedList> createState() => FeedListState();
}

class FeedListState extends State<FeedList>  {
  TextEditingController commentController = TextEditingController();
  

  void addComment() {
    // Will implement later, needs to get data from API and local input
  }

  void showCommentDialog() {
     showDialog(
      context: context, builder: (context) => AlertDialog(
        title: const Text('Add Comment'),
        content: TextField(
          controller: commentController,
          decoration: InputDecoration(
            hintText: 'Write a comment...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
                // Post comment functionality needed
            },
            child: const Text('Submit'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: VConstants.darkNeutral2,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 25, left:25, right: 25),
      padding: const EdgeInsets.all(15),
      child: 
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Container(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            padding: const EdgeInsets.all(10),
            child: const Icon(
              Icons.person,
              color: VConstants.codeWhite,
            ),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('User',
              style: TextStyle(color: VConstants.codeWhite)
              ),
              SizedBox(height: 10),
              Text('Message'),
            ],
          ),
          const SizedBox(width: 130),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CommentButton(onTap: showCommentDialog)
            ],
          ),
        ],
        ),
      );
  }
}

