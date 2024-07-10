import 'package:flutter/material.dart';
import 'package:verademo_dart/pages/reset.dart';

import '../pages/blabbers.dart';
import '../pages/feed.dart';
import '../pages/logout.dart';
import '../pages/profile.dart';
import '../pages/tools.dart';
import '../theme/text_theme.dart';
import '../utils/constants.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.username});

  final String username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  late final List<Widget> screens = [
    FeedPage(username: widget.username,),
    ProfilePage(username: widget.username),
    BlabbersPage(username: widget.username),
    ToolsPage(username: widget.username),
    LogoutPage(username: widget.username),
  ];

  final List<String> headers = [
    'Feed',
    'Profile',
    'Blabbers',
    'Tools',
    'Logout',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(headers[currentPageIndex], context),
      body: screens[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Feed'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        NavigationDestination(icon: Icon(Icons.people), label: 'Blabbers'),
        NavigationDestination(icon: Icon(Icons.design_services), label: 'Tools'), /* there is a wrench one, don't know what its called though */
        NavigationDestination(icon: Icon(Icons.logout), label: 'Logout'),
          /*
          onPressed: (){
            
            print('Navigator popping');
            Navigator.pop(context);},)
            }
            */
        ],
        selectedIndex: currentPageIndex,
        indicatorColor: VConstants.veracodeBlue,
        backgroundColor: VConstants.veracodeBlack,
        
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
ImageIcon veraIcon = const ImageIcon(AssetImage("assets/VCicon.png"), color: VConstants.veracodeBlue, size:24);

class HeaderBar extends AppBar{
  HeaderBar(String pageName, BuildContext context, {super.key}):super(
    toolbarHeight: 83,
    leadingWidth: 55,
    leading: veraIcon,
    title: Text(pageName, style: VTextTheme.defaultTextTheme.titleMedium  /*page name variable here*/,),
    centerTitle: true,
    backgroundColor: VConstants.veracodeBlack,
    actions: <Widget>[
      resetButton(context)
      ],
    );

  static IconButton resetButton(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.repeat,
        color: VConstants.veracodeWhite,
      ),
      iconSize: 48,
      onPressed: () {
        showDialog(
          context: context, 
          builder: (BuildContext context) {
            return const resetPopup();
          });} /*run reset controller,*/
      );
  }
}