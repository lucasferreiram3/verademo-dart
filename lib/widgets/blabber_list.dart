
import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/utils/shared_prefs.dart';
import 'package:verademo_dart/widgets/profile_image.dart';

class BlabberList extends StatelessWidget
{
  final String username;

  const BlabberList(this.username,{super.key});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      textColor: VConstants.veracodeWhite,
      child: ListView(
        children: ListTile.divideTiles(
          context: context,
          color: VConstants.lightNeutral3,
          tiles: buildItemList()).toList()
      ),
    );
  }

  List<Widget> buildItemList()
  {
    print("Building API call to /users/getBlabbers/");
    const url = "${VConstants.apiUrl}/users/getBlabbers/";
    final uri = Uri.parse(url);
    final Map<String, String> headers = {
      "content-type": "application/json",
      "Authorization": "${VSharedPrefs().token}"
    };

    
    List<Widget> items = [];
    for (int i=0; i<username.length; i++)
    {
      items.add(buildListItem(username[i]));
    }
    return items;
  }

  Widget buildListItem(String title) {
    String name = title.toLowerCase();
    return ListTile(
      // leading: CircleAvatar(
      //   foregroundImage: AssetImage('assets/images/$name.png'),
      //   backgroundImage: const AssetImage('assets/images/default_profile.png'),
      // ),
      leading: VAvatar(name, radius: 20),
      title: Text(title),
      trailing: Checkbox(
        value: true,
        onChanged: (bool? value) {},
      ),
    );
  }
  
}