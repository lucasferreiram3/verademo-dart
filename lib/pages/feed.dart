import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:verademo_dart/model/User.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/widgets/blabber_list.dart';
import 'package:verademo_dart/widgets/feed_radio.dart';
import 'package:verademo_dart/widgets/feed_list.dart';

class FeedPage extends StatefulWidget {

  final String username;

  const FeedPage({super.key, required this.username});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  late Future<User> futureUser;
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureUser = getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VConstants.darkNeutral1,
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
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return const FeedList(message: 'Message', user: 'Username', time: 'Time');
                  } 
                ),                    //FeedList(message: 'Message', user: 'Username', time: 'Time')
              ),
            ],
              ),
      ),
    );
  }
  void showCommentDialog() {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
      title: Text('Add a Comment'),
      content: TextField(
        controller: commentController,
        decoration: const InputDecoration(
          hintText: 'Write a Comment......'
        ),
      ),
      actions: [
        ElevatedButton(
          child: const Text('Post'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ElevatedButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
    );
}

  Future<User> getUserList()
  async {
    print("Building API call to /users/login/");
    const url = "${VConstants.apiUrl}/users/login/";
    final uri = Uri.parse(url);
    final Map<String, String> headers = {
        HttpHeaders.authorizationHeader: 'Token: 21232F297A57A5A743894A0E4A801FC3'
      };
    final response = await http.get(uri, headers: headers);

    print('Response Received with status code: ${response.statusCode}');
    if (response.statusCode == 200)
    {
      print('Success!');
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }
    else{
      print('Throwing exception');
      throw Exception('Failed to load album');
    }
  }
  void addBlab(String text) {
    // Add blab to the list of blabs
  }



   
}