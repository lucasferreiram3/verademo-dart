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

  }
  Future<void> fortune(file) async {

  }


}