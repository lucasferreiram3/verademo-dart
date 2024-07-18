import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:verademo_dart/model/User.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/utils/shared_prefs.dart';
import 'package:verademo_dart/widgets/blabber_list.dart';

class BlabbersPage extends StatefulWidget {
  final String username;

  const BlabbersPage({super.key, required this.username});

  @override
  State<BlabbersPage> createState() => _BlabbersPageState();
}

class _BlabbersPageState extends State<BlabbersPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VConstants.darkNeutral1,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 44,
                width: 151,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: VConstants.darkNeutral2,),
                  alignment: Alignment.center,
                  child: Text('Blabber',
                    style: Theme.of(context).textTheme.headlineMedium ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 44,
                width: 86,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: VConstants.darkNeutral2,),
                  alignment: Alignment.center,
                  child: Text('Listening',
                  style: Theme.of(context).textTheme.headlineMedium),
                ),
              ),
            )
          ],),
          Expanded(
            child: Container(
              child: BlabberList("${VSharedPrefs().token}")
              
              /*const Center(
                child: Text(
                  'No Blabs yet...',
                  style: TextStyle(color: VConstants.codeWhite),
                ),
              ),*/
            ),
          ),
        ],
      ),
        );
  }

  Future<User> getUserList()
  async {
    print("Building API call to /users/login/");
    const url = "${VConstants.apiUrl}/users/login/";
    final uri = Uri.parse(url);
    final Map<String, String> headers = {
        HttpHeaders.authorizationHeader: 'Token: 21232F297A57A5A743894A0E4A801FC3'
      };
    final response = await http.get(uri, headers: headers);

    print('Response Received with status code: ${response.statusCode}');
    if (response.statusCode == 200)
    {
      print('Success!');
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }
    else{
      print('Throwing exception');
      throw Exception('Failed to load album');
    }
  }
}