import 'package:flutter/material.dart'; // brings all the necessary packages

void main() { // runs as soon as you run the program
  runApp(const MyApp());
}

class Post {
  String body;
  String author;
  int likes = 0;
  bool userLiked = false;

  Post(this.body, this.author);

  void likePost() {
    this.userLiked = !this.userLiked;

    if(this.userLiked){
      likes++;
    }
    else{
      likes--;
    }
  }
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
 List<Post> posts = []; // store the posts

//-----------------------------------------------------------------------
 // function that is passed as a callback
  void newPost(String text) {
    this.setState(() {  // sets the text equals to the param
      posts.add(new Post(text, "Me"));  // updates the posts
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
    FocusScope.of(context).unfocus(); // get rid of the keyboard focus
    controller.clear();   // clears the input
    widget.callback(controller.text);   // widget. gives access to everything of the parant class
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

class PostList extends StatefulWidget {
  final List<Post> listItems;

  PostList(this.listItems);

  @override
  State<PostList> createState() => _PostListState();
}
// .builder is function that will executed whenever we add a new item and it builds each individual item
class _PostListState extends State<PostList> {

  void like(Function callback) {
    this.setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listItems.length,
      itemBuilder: (context, index) {
        var post = this.widget.listItems[index];
        return Card(child: Row(children: <Widget>[
          Expanded(child: 
            ListTile(
              title: Text(post.body), 
              subtitle: Text(post.author),
              )), 
              
          Row(children: <Widget>[
            Container(child: Text(
                              post.likes.toString(), 
                              style: TextStyle(fontSize: 20)),
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              ),
            IconButton(
            color: post.userLiked ? Colors.blue : Colors.black,
            icon: Icon(Icons.thumb_up),
            onPressed: () => like(post.likePost),
            )])
            ]
          ),
        );
      },
    );
  }
}