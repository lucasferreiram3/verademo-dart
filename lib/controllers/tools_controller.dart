import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:io';

class ToolsController {
  Future<void> processTools() async {
    File file = new File("fortuneFile"); // May or may not need to change depending on fortunefile for dart
    String host = Platform.localHostname;
    String fortuneFile = basename(file.path); 
  }
  Future<void> ping(host) async {
    String output = "";

    try {
      var proc = await Process.run('grep', ['bash', '-c', 'ping -c1 '] + host);
    } on Exception{}
  }
  Future<void> fortune(file) async {
    String output = "";
  }


}