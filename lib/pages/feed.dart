import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color veracodeBlack = Color.fromARGB(255, 36, 38, 38);
const Color veracodeBlue =  Color.fromARGB(255, 0, 179, 230);
const Color veracodeWhite = Color.fromARGB(255,244, 244, 244);
Image logo = Image.asset('assets/VCicon.png');

AppBar headerBar = AppBar(
  leading: logo,
  title: Text("test", style:  GoogleFonts.lato(
    textStyle: const TextStyle(color: Colors.white))/*page name variable here*/,),
  centerTitle: true,
  backgroundColor: veracodeBlack,
  actions: <Widget>[
    IconButton(
      icon: const Icon(
        Icons.settings,
        color: veracodeWhite,
      ),
      onPressed: (){print('pressed settings icon');} /*run reset controller,*/
      )
  ],
); 

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});
  
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: headerBar,
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