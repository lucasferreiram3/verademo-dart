import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Define colors to be used
const Color veracodeBlack= Color.fromARGB(255, 36, 38, 38);
const Color veracodeBlue =  Color.fromARGB(255, 0, 179, 230);
const Color veracodeWhite = Color.fromARGB(255,244, 244, 244);

//Create themes
AppBar header = AppBar(
  title: Text("hello", style: GoogleFonts.lato(),)/*page name variable here*/,
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
    return MaterialApp(
      title: 'Blab-a-Gag',
      /*theme: ThemeData(
        appBarTheme: ,
        navigationBarTheme: ,
        colorScheme: ColorSche
      ),*/
      home: Scaffold(
        appBar: header,
        /*AppBar(
          backgroundColor: veracodeBlack,
          title: Text('hello world',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(color: Colors.blue, fontSize: 30),
            )),

        ),
        */
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