import 'package:flutter/material.dart'; // brings all the necessary packages

void main() { // runs as soon as you run the program
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boladaum',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    // sets up the basic structure of a page
    return Scaffold(  
      appBar: AppBar(title: Text('Hello')),
      body: Column(children: <Widget>[TestWidget(), TestWidget(), TestWidget()]),
    );
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[Text('Hello World!'), Text(' Hello World!'), Text(' Hello World!')]);
  }
}

// WIDGETS -> Scaffold, AppBar, MaterialApp, Text, Row, Column