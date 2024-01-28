import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main () {
 runApp(Reyes());
}

class Reyes extends StatelessWidget {
  const Reyes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.connected_tv_sharp),
          title: Text('ListView Builder'),
        ),
        body: Reyes2(),
      ),
    );
  }
}

class Reyes2 extends StatefulWidget {
  const Reyes2({super.key});

  State<Reyes2> createState() => _Reyes2();
}

class _Reyes2 extends State<Reyes2> {

  List<String> names = ['Chalbert Reyes', 'Charlene Reyes', 'Roberlito Reyes'];

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.person_pin),
            title: Text(names[index]),
            subtitle: Text(names[index].length.toString()),
          );
        }
    );
  }
}

