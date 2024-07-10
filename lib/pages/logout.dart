import 'package:flutter/material.dart';

class LogoutPage extends StatefulWidget {
  final String username;

  const LogoutPage({super.key, required this.username});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.username),
    );
  }
}