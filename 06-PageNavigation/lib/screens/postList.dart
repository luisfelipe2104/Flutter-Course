import 'package:flutter/material.dart'; // brings all the necessary packages
import './post.dart';

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
      itemBuilder: (context, index) { // itarates through each item in the list
        var post = this.widget.listItems[index];  // access an especific item from the list
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