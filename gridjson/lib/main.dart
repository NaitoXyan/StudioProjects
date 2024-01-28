import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gridjson/secondPage.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Grid images'),
        ),

        body: PhotoGrid(),
      ),
    );
  }
}

class PhotoGrid extends StatefulWidget {

  State<PhotoGrid> createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {

  void initState() {
    AccessPhotos();
    super.initState();
  }

  List<dynamic> allData = [];

  AccessPhotos() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/photos');
    var response = await http.get(url);

    setState (() {
      allData = jsonDecode(response.body);
      print(allData.length);
        });
  }

  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(allData.length, (index) {
        return ListTile(
          title: Image.network(allData[index]["thumbnailUrl"]),

          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage(
              imageDisplay: allData[index]["url"],
              imageTitle: allData[index]["title"],
            ))
          ),
        );
      })
    );
  }
}
