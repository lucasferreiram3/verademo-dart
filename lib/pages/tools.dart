import 'package:flutter/material.dart';

class ToolsPage extends StatefulWidget {
  final String username;

  const ToolsPage({super.key, required this.username});

  @override
  State<ToolsPage> createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.username),
    );
  }
}