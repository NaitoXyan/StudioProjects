import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  var imageDisplay;
  var imageTitle;

  SecondPage ({
    this.imageDisplay,
    this.imageTitle,
    Key? key
}): super (key: key);

  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second page')
      ),

      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(imageDisplay),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(imageTitle,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
            )
          ],
        )
      )
    );
  }
}