import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget{
  final String data;

  SecondPage({
    required this.data,
    Key? key
  }) : super(key: key);

  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>{
  final _exitForm = GlobalKey<FormState>();
  String pasaString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.data),

              Form(
                  child: ElevatedButton(
                    onPressed: (){
                      if (widget.data == 'Chalbert'){
                        pasaString = 'gwapo sign out';
                      }

                      else if (widget.data == 'Reyes'){
                        pasaString = 'handsome dude';
                      }

                      else{
                        pasaString = 'wala ko kaila';
                      }

                      Navigator.pop(context, pasaString);
                    },
                    child: Text('Exit'),
                  )
              )
            ],
          )
      ),
    );
  }
}