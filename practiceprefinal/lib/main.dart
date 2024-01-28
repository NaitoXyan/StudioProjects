import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Widget build (BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Pre Final Practice'),
        ),

        body: HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatefulWidget {

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    accessPhotos();
    super.initState();
  }

  var textController = TextEditingController();
  var nameContainer = "text";
  List<dynamic> photoLib = [];

  Widget build (BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container (
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red)
            ),
            child: nameForm(),
          )
        ),

        Expanded(
          flex: 7,
          child: displayPictures(),
        )
      ],
    );
  }

  accessPhotos () async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var response = await http.get(url);

    setState(() {
      photoLib = jsonDecode(response.body);
    });
  }

  Widget displayPictures () {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(photoLib.length, (index) {
        return ListTile(
          title: Image.network(photoLib[index]["thumbnailUrl"]),
        );
      }),
    );
  }

  Widget nameForm () {
    return Column(
      children: [
        TextFormField(
          controller: textController,
          decoration: InputDecoration(
            label: Text('Enter name')
          ),
        ),

        ElevatedButton(
          onPressed: () {
            setState(() {
              setString();
            });
          },
          child: Text('Submit'),
        ),

        ElevatedButton(
          onPressed: () async {
            final thisVal = await getString();
            setState(() {
              nameContainer = thisVal;
            });
          },
          child: Text('Display'),
        ),
        
        Text(nameContainer)
      ],
    );
  }

  setString() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', textController.text);
  }

  getString() async {
    final prefs = await SharedPreferences.getInstance();
    final String nameCon = prefs.getString('name') ?? " ";
    return nameCon;
  }
}