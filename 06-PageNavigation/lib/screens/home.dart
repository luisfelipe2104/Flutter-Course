import 'package:flutter/material.dart'; // brings all the necessary packages
import './post.dart';
import './textInput.dart';
import './postList.dart';

//------------------------------------------------

class MyHomePage extends StatefulWidget {
  final String name;

  MyHomePage(this.name);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 List<Post> posts = []; // store the posts

//-----------------------------------------------------------------------
 // function that is passed as a callback
  void newPost(String text) {
    this.setState(() {  // sets the text equals to the param
      posts.add(new Post(text, widget.name));  // updates the posts
    });
  }
// EXPANDED -> FILLS AS MANY SPACE AS POSSIBLE
//-----------------------------------------------------------------------
  @override
  Widget build(BuildContext context){
    // sets up the basic structure of a page
    return Scaffold(  
      appBar: AppBar(title: Text('Hello')),
      body: Column(
        children: <Widget>[
          Expanded(child:
          PostList(this.posts)),

          TextInputWidget(this.newPost)  
          ],)
    );
  }
}