import 'package:flutter/material.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/widgets/app_bar.dart';
import 'package:verademo_dart/widgets/profile_image.dart';

class BlabPage extends StatefulWidget {
  const BlabPage({super.key});

  @override
  State<BlabPage> createState() => _BlabPageState();
}

class _BlabPageState extends State<BlabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VAppBar('Blab'),
      body: Padding(
        padding: VConstants.pagePadding,
        child: Column(
          children: [
          BlabBox(context),
          const SizedBox(height: 10,),
          const CommentBar(),
        ],),
      ),

    );
  }
}

class CommentBar extends StatelessWidget {
  const CommentBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  hintText: 'Add comment...',
                  filled: true,
                  fillColor: VConstants.darkNeutral2,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
            ),
            const SizedBox(width: 8,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BlabPage()),);
              },
              child: const Text('Add'),
            ),
          ],
        );
  }
}



Container BlabBox(context){
  return Container(
    decoration: BoxDecoration(
        color: VConstants.darkNeutral2,
        borderRadius: BorderRadius.circular(10),
      ),
      
    width: double.infinity,
    child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              BlabberHeader(),
              SizedBox(height: 10,),
              Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              softWrap: true,

              ),
        ]),
      ),);
  
}

class BlabberHeader extends StatelessWidget {
  const BlabberHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      const VAvatar('brian', radius:30),
      const SizedBox(width: 10,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("blabName",
            style: Theme.of(context).textTheme.headlineMedium, ),
          Text("timestamp", 
            style: Theme.of(context).textTheme.labelSmall),
        ],
                ), 
              ],);
  }
}

// TODO: Implement comment retrieval
/*
Map getBlabComments(blabID)
async {
  Map results = {};

  print("Building API call to /posts/getBlabComments/");
    const url = "${VConstants.apiUrl}/posts/getBlabComments/";
    final uri = Uri.parse(url);
    final body = jsonEncode(<String, String> {
      "blabID":blabID
    });
    final Map<String, String> headers = {
      "content-type": "application/json",
      "Authorization": VSharedPrefs().token ?? "",
    };

    // Execute API call for updateProfile/
    final response = await http.post(uri, headers: headers, body: body);
    print("Executed API call to updateProfile");

  return results
}
*/