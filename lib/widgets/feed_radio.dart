import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/shared_prefs.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/widgets/feed_list.dart';
import 'package:verademo_dart/widgets/myblabs_list.dart';
import 'package:http/http.dart' as http;

// enum type for switching between containers on same page
enum WidgetState {
  Feed, MyBlabs
}

class FeedRadio extends StatefulWidget {
  const FeedRadio({super.key});

  @override
  State<FeedRadio> createState() => _FeedRadioState();
}

class _FeedRadioState extends State<FeedRadio> {
  WidgetState currentWidget = WidgetState.Feed;
  int currentSelect = 0;
  late Future<List<Widget>> _data;


  

  @override
  initState()
  {
    super.initState();
    _data = getData();
  }
  Future<List<Widget>> getData() async {
    print("Building API call to /posts/getBlabsForMe/");
    const url = "${VConstants.apiUrl}/posts/getBlabsForMe";
    final uri = Uri.parse(url);
    final Map<String, String> headers = {
      "content-type": "application/json",
      "Authorization": "${VSharedPrefs().token}"
    };
    await Future.delayed(const Duration(seconds: 2));
    
    final response = await http.get(uri, headers: headers);
     // Convert output to JSON
    final data = jsonDecode(response.body)["data"] as List;

    List<Widget> items = [];
    for (int i=0; i<data.length; i++)
    {
      items.add(FeedList(data[i]));
    }
    return items;
  }
  Widget build(BuildContext context) {
    return FutureBuilder<List<Widget>>(
      future: _data,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          final error = snapshot.error;
          return Text('Error: $error');
        } else if (snapshot.hasData) {
          return Column( 
                  children: [ 
                  SizedBox(
                    height: 40,
                    width: 240,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentWidget = WidgetState.Feed;
                                currentSelect = 0;
                              });
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: (currentSelect==0) ? VConstants.veracodeBlue : VConstants.veracodeBlack),
                            child: const Text('Feed'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentWidget = WidgetState.MyBlabs;
                                currentSelect = 1;
                              }
                              );
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: (currentSelect==1) ? VConstants.veracodeBlue : VConstants.veracodeBlack),
                            child: const Text('My Blabs'),
                            
                          ),
                          
                        ), 
                        const SizedBox(width: 16),
                        
                      ],
                    ),
                  ),
                  Container(
                    child: getContainer()
                  )
                  ],
                   
              );
        } else {
            return const Center(
              child: CircularProgressIndicator(
                color: VConstants.veracodeBlue,));
          }
      },
      
    );
    
  }
  Widget getContainer() {
    return FutureBuilder<List<Widget>>(
      future: _data,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          final error = snapshot.error;
          return Text('Error: $error');
        } else if (snapshot.hasData) {
          List<Widget> data = snapshot.data as List<Widget>;
          switch (currentWidget) {
            case WidgetState.Feed:
            return SizedBox(
              height: 450,
              child: ListView.builder(
                itemBuilder:(context, index) => FeedList(data),
              )
            );
            case WidgetState.MyBlabs:
            return SizedBox(
              height: 450,
              child: ListView(
              children: const [
                MyBlabs()
              ],
            )
          );
      }  
        } else {
            return const Center(
              child: CircularProgressIndicator(
                color: VConstants.veracodeBlue,));
          }
      },
      
    );
  }
  
  
}


