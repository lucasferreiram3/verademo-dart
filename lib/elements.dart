import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Colors
const Color veracodeBlack = Color.fromARGB(255, 36, 38, 38);
const Color veracodeBlue =  Color.fromARGB(255, 0, 179, 230);
const Color veracodeWhite = Color.fromARGB(255,244, 244, 244);

TextStyle pageTitle = GoogleFonts.lato(
    textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40, ));
Image icon = Image.asset('assets/VCicon.png');

//HeaderBar to be used by the main pages. Need to implement State so that page name can change.
class HeaderBar extends AppBar{
  HeaderBar({super.key}):super(
    toolbarHeight: 83,
    leadingWidth: 55,
    leading: icon,
    title: Text("test", style: pageTitle/*page name variable here*/,),
    centerTitle: true,
    backgroundColor: veracodeBlack,
    actions: <Widget>[
      IconButton(
        icon: const Icon(
          Icons.repeat,
          color: veracodeWhite,
        ),
        iconSize: 48,
        onPressed: (){print('pressed reset icon');} /*run reset controller,*/
        )
      ],
    );
}

class BottomMenu extends NavigationBar{
  BottomMenu({super.key}):super(
    destinations: []
  );
}
