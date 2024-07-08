import 'package:flutter/material.dart';
import 'package:verademo_dart/elements.dart';
//Colors

AppBar headerBar = HeaderBar();
NavigationBar navBar = BottomMenu();

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});
  
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: headerBar,
        //bottomNavigationBar: navBar,
        body: const SizedBox(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text('Hello'),
              ),
          ),
        )
      ,);
  }
}