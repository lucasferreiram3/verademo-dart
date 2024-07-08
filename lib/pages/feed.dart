import 'package:flutter/material.dart';
import 'package:verademo_dart/elements.dart';
//Colors

AppBar headerBar = HeaderBar();
//NavigationBar navBar = BottomMenu();

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});
  
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: headerBar,
        bottomNavigationBar: NavigationBar(destinations: const [
      NavigationDestination(icon: Icon(Icons.home), label: 'Feed'),
      NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
      NavigationDestination(icon: Icon(Icons.people), label: 'Blabbers'),
      NavigationDestination(icon: Icon(Icons.design_services), label: 'Tools'), /* there is a wrench one, don't know what its called though */
      NavigationDestination(icon: Icon(Icons.logout), label: 'Logout')
    ],
    backgroundColor: veracodeBlack,
    ),
        body: <Widget>[const Text('Hello'), 
          const Text('Test'),
          const Text('three')][currentPageIndex]
        /*const SizedBox(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('Hello'),
                ),
            ),
          ),*/
      );
  }
}