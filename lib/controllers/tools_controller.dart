import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:io';

class ToolsController {
  Future<void> processTools() async {
    File file = File("fortuneFile"); // May or may not need to change depending on fortunefile for dart
    String host = Platform.localHostname;
    String fortuneFile = basename(file.path); 
  }
  Future<String> ping(host) async {
    String output = "";

    try {
      try {
        var proc = await Process.run('grep', ['bash', '-c', 'ping -c1 '] + host).timeout(const Duration(seconds: 5));
        output = proc.stdout;
        
      } on TimeoutException {
        output = "Ping has timed out!"; // Placeholder will replace with actual handling later
      }

    } on Exception{
      output = "Error occured intiating ping"; // Placeholder will replace with actual handling later
    }
    return output;
  }
  Future<String> fortune(file) async {
    String cmd = "/bin/fortune" + file;
    String output = "";
    try {
      try{
        var proc = await Process.run('grep', ['bash', '-c', cmd]).timeout(const Duration(seconds:5));
        output = proc.stdout;

      } on TimeoutException {
        output = "Fortune has timed out!"; // Placeholder will replace with actual handling later
      }
    } on Exception {
      output = "Error occured intiating fortune"; // Placeholder will replace with actual handling later
    }

    return output;
  }
 
}