import 'package:flutter/material.dart';

void main() => runApp(new ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Chat App',
      theme: new ThemeData.light(),
      home: new ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ChatScreenState();
  }
}

//
class ChatScreenState extends State<ChatScreen> {
  final TextEditingController textEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Chat App"),
        centerTitle: true,
        textTheme: TextTheme(
            title:
                new TextStyle(fontFamily: 'Raleway-Regular', fontSize: 20.0)),
        backgroundColor: Colors.redAccent,
      ),


      body: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        color: Colors.white,
        height: 20.0,
        child:new TextField(
          controller: textEditingController,
          style: TextStyle(fontFamily: 'Raleway-Regular'),
          onSubmitted: _handleSubmitted,
          decoration:
              new InputDecoration.collapsed(hintText: "What's on your mind!"),
        ),
      ),
    );


  }

  void _handleSubmitted(String text) {
    textEditingController.clear();
  }
}
