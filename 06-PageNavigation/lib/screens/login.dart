import 'package:flutter/material.dart'; // brings all the necessary packages
import './home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(title: Text('Hello')),
      body: Body()
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name = "";
  TextEditingController controller = new TextEditingController();

  void click() {
    this.name = controller.text;
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyHomePage(this.name))
      );
  }

  @override
  Widget build(BuildContext context) {
    return Align(   // aligns the widget in whatever direction you want
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(10), 
        child: TextField(controller: controller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "Type Your Name:",
                          border: OutlineInputBorder(borderSide: BorderSide(
                                                          width: 5, 
                                                          color: Colors.black)),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.done),
                            splashColor: Colors.blue,
                            tooltip: "Submit",
                            onPressed: this.click,
                            )
                        )),
        ),
    );
  }
}