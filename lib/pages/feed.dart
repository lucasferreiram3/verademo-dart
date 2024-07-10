import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key, required this.username});

  final String username;

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  /*
  late Future<User> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchUser
  }*/

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('test'),
    );
  }
}