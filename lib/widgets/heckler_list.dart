import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/utils/shared_prefs.dart';
import 'package:verademo_dart/widgets/profile_image.dart';

class HecklerList extends StatefulWidget
{
  final List hecklers;

  const HecklerList(this.hecklers,{super.key});

  @override
  State<HecklerList> createState() => _HecklerListState();
}

class _HecklerListState extends State<HecklerList> {
  
  @override
  Widget build(BuildContext context) {

    return  ListTileTheme(
              textColor: VConstants.veracodeWhite,
              child: ListView(
                children: ListTile.divideTiles(
                  context: context,
                  color: VConstants.lightNeutral3,
                  tiles: listBuilder(widget.hecklers)).toList()
      ),
    );

    /*
    return  ListTileTheme(
      textColor: VConstants.veracodeWhite,

      child: ListView(

        
        children: ListTile.divideTiles(
          context: context,
          color: VConstants.lightNeutral3,
          tiles: []/**/).toList()
      ),
    );
    */
  }

  List<Widget> listBuilder(List hecklers)
  {
    List<Widget> items = [];
    for (int i=0; i<hecklers.length; i++)
    {
      items.add(buildListItem(hecklers[i]));
    }
    return items;
  }

  Widget buildListItem(Map user) {
    String name = user['username'].toLowerCase();
    return ListTile(
      leading: VAvatar(name, radius: 20),
      title: Text(name),
    );
  }

  void ignore(String blabberUser)
  async {
    print("Building API call to /users/ignore/");
    const url = "${VConstants.apiUrl}/users/ignore/";
    final uri = Uri.parse(url);
    final Map<String, String> headers = {
      "content-type": "application/json",
      "Authorization": "${VSharedPrefs().token}"
    };
    final body = jsonEncode(<String, String> {
        "blabberUsername": blabberUser
      });
    final response = await http.post(uri, headers: headers, body: body);

    if (response.statusCode == 200) {
        // Register successful
        print(response.body);
    } else {
        // Register failed
        final data = json.decode(response.body)["data"];
        print(data);
    }
  }

  void listen(String blabberUser)
  async {
    print("Building API call to /users/listen/");
    const url = "${VConstants.apiUrl}/users/listen/";
    final uri = Uri.parse(url);
    final Map<String, String> headers = {
      "content-type": "application/json",
      "Authorization": "${VSharedPrefs().token}"
    };
    final body = jsonEncode(<String, String> {
        "blabberUsername": blabberUser
      });
    final response = await http.post(uri, headers: headers, body: body);

    if (response.statusCode == 200) {
        // Register successful
        print(response.body);
    } else {
        // Register failed
        final data = json.decode(response.body)["data"];
        print(data);
    }
  }
}