import 'package:flutter/material.dart';
import 'package:reyes_activity2/increment.dart';

void main (){
  runApp(const ReyesAct2());
}

class ReyesAct2 extends StatelessWidget {
  const ReyesAct2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DefaultTabController(
          length: 2,
          child: IncrementCounter(),
      )
    );
  }
}