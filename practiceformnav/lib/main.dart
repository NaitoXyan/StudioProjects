import 'package:flutter/material.dart';
import 'package:practiceformnav/secondPage.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget{

  Widget build(BuildContext context){
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget{

  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>{

  Widget build(BuildContext context){
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Practice lang'),
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.add),),
              Tab(icon: Icon(Icons.ac_unit),)
            ])
          ),

          body: TabBarView(children: [
            LoginForm(),
            Text('data')
          ]),
        )
    );
  }
}

class LoginForm extends StatefulWidget{
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>{
  TextEditingController userText = TextEditingController();
  TextEditingController passwordText = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String userString = '';
  String? passwordString;
  String titleThing = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Center(
        child: Column(
          children: [
            Text(titleThing),

            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                validator: (value) {
                  if (value == ''){
                    return 'Please Text';
                  }
                  return null;
                },
                controller: userText,
                decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrangeAccent)
                    )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                validator: (value){
                  if (value?.length != 5){
                    return 'short password';
                  }
                  return null;
                },
                controller: passwordText,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)
                    )
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () async {
                var validForm = formKey.currentState!.validate();

                if(validForm){
                  userString = userText.text;
                  passwordString = passwordText.text;

                  var saveIt = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondPage(data: userString,))
                  );

                  setState(() {
                    titleThing = saveIt;
                  });
                }
              },

              child: Text('Login'),
            ),

          ],
        ),
      ),
    );
  }
}
