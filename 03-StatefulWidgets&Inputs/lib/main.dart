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
      body: TextInputWidget()
    );
  }
}

// stful
class TextInputWidget extends StatefulWidget {  // class responsible for render the state and rendering
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController(); // manages the change in the text of the input
  String text = "";

  @override
  void dispose() {  // cleans up the object, otimizes the memory
    super.dispose();
    controller.dispose();
  }

  void changeText(text){
    if (text == "Hello World!") {
      controller.clear(); // cleans the input
      text="";  // sets the params equals to none
    }
    setState(() {
      this.text = text;  // changes the text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          onChanged: (text) => this.changeText(text),
          controller: this.controller,
          decoration: InputDecoration(prefixIcon: Icon(Icons.message), 
                                      labelText: "Type a message:")
      ),
      Text(this.text)
      ]);
  }
}

// WIDGETS -> Scaffold, AppBar, MaterialApp, Text, Row, Column