import 'package:flutter/material.dart';

void main(){
  runApp( const MyApp() );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Hello World')
        ,),
        body: const SizedBox(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text('Hello'),
              ),
          ),
        )
      ,)
    );
  }
}