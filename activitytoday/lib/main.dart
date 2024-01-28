import 'package:flutter/material.dart';

void main() {
  runApp(RootScreen());
}

class RootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise 1'),
        backgroundColor: Colors.lightBlueAccent,
      ),

      body: Form(
        child: ListView(
          children: [
            TextFormField(
              controller: emailControl,
              decoration: InputDecoration(
                labelText: 'Email Address',
              ),
            ),

            TextFormField(
              controller: passwordControl,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),

            ElevatedButton(
              onPressed: () {
                print(emailControl.text);
                print(passwordControl.text);
              },
              child: Text('button'),
            )
          ],
        ),
      ),
    );
  }
}