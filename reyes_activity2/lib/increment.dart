import 'package:flutter/material.dart';

class IncrementCounter extends StatefulWidget {
  const IncrementCounter({super.key});

  @override
  State<IncrementCounter> createState() => _IncrementCounter();
}

class _IncrementCounter extends State<IncrementCounter> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.code),
          title: const Text('Basic App Layout'),
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.home),),
            Tab(icon: Icon(Icons.message),)
          ])
      ),

      body: const TabBarView(children: [
        Center(
            child:
            Text('1st Tab')),
        Center(
            child:
            Text('2nd Tab'))
      ]
      ),

      floatingActionButton: incrementCount(),

      bottomNavigationBar: displayCounter(),
    );
  }

  Widget incrementCount () {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        setState(() {
          counter++;
        });
      },
    );
  }

  Widget displayCounter() {
    return SizedBox(
      height: 50,
        child: BottomAppBar(
          color: Colors.lightBlue,
          child: Center(
            child: Text(
              'Counter = $counter',
              textAlign: TextAlign.center,
            ),
          ),
        )
    );
  }
}
