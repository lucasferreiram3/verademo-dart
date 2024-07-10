import 'package:flutter/material.dart';

class BlabbersPage extends StatefulWidget {
  final String username;

  const BlabbersPage({super.key, required this.username});

  @override
  State<BlabbersPage> createState() => _BlabbersPageState();
}

class _BlabbersPageState extends State<BlabbersPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.username),
    );
  }
}