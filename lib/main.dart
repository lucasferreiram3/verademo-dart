import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/login.dart';

// Define colors to be used
const Color veracodeBlack= Color.fromARGB(255, 36, 38, 38);
const Color veracodeBlue =  Color.fromARGB(255, 0, 179, 230);
const Color veracodeWhite = Color.fromARGB(255,244, 244, 244);

//Create themes
AppBar headerBar = AppBar(
  leading: Image.asset('assets/VCicon.png'),
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
      onPressed: (){print(veracodeWhite);} /*run reset controller,*/
      )
  ],
); 

void main(){
  runApp( const MyApp() );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Blab-a-Gag',
      /*theme: ThemeData(
        appBarTheme: ,
        navigationBarTheme: ,
        colorScheme: ColorSche
      ),*/
      home: LoginPage()
      // Scaffold(
      //   appBar: AppBar(
      //     backgroundColor: veracodeBlack,
      //     title: const Text('hello world', 
      //       style: TextStyle(
      //         fontSize: 40,
      //         fontFamily: 'Lato',
      //         color:veracodeWhite),),
      //   ),
      //   body: const SizedBox(
      //     child: Center(
      //       child: Padding(
      //         padding: EdgeInsets.all(10),
      //         child: Text('Hello'),
      //         ),
      //     ),
      //   )
      // ,)
    );
  }
}