import 'package:flutter/material.dart'; // brings all the necessary packages
import './screens/home.dart';
import './screens/login.dart';

void main() { // runs as soon as you run the program
  runApp(const MyApp());
}

//------------------------------------------------------------------------------------------------

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
      home: LoginPage(),
    );
  }
}



