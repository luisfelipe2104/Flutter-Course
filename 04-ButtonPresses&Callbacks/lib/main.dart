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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

//-----------------------------------------------------------------------
 // function that is passed as a callback
  void changeText(String text) {
    this.setState(() {
      this.text = text;  // sets the text equals to the param
    });
  }

//-----------------------------------------------------------------------
  @override
  Widget build(BuildContext context){
    // sets up the basic structure of a page
    return Scaffold(  
      appBar: AppBar(title: Text('Hello')),
      body: Column(
        children: <Widget>[
          TextInputWidget(this.changeText),
          Text(this.text)
          ],)
    );
  }
}

// stful
class TextInputWidget extends StatefulWidget {  // class responsible for render the state and rendering
  final Function(String) callback; // declares the type of the param (it's the param that is received, in this case the function changeText)

  TextInputWidget(this.callback); // declares that this function/class needs a param

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController(); // manages the change in the text of the input

  @override
  void dispose() {  // cleans up the object, otimizes the memory
    super.dispose();
    controller.dispose();
  }

//-----------------------------------------------------------------------
  void click() {  // passes the input text as a param to the callback
    widget.callback(controller.text);   // widget. gives access to everything of the parant class
    controller.clear();   // clears the input
  }

//-----------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return
        TextField(
          controller: this.controller,
          decoration: InputDecoration(prefixIcon: Icon(Icons.message), 
                                      labelText: "Type a message:",
                                      suffixIcon: IconButton(
                                                    icon: Icon(Icons.send), 
                                                    splashColor: Colors.blue,
                                                    tooltip: "Post message",
                                                    onPressed: this.click))
      );
  }
}

// WIDGETS -> Scaffold, AppBar, MaterialApp, Text, Row, Column