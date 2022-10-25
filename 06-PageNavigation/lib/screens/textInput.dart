import 'package:flutter/material.dart'; // brings all the necessary packages

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
    FocusScope.of(context).unfocus(); // get rid of the keyboard focus
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
                                                    onPressed: this.click)
                                                    )
      );
  }
}
