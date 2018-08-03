import 'package:flutter/material.dart';
const String _name = "Suneet Srivastava";
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
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            color: Colors.white,
            height: 20.0,
            child: new Row(
              children: <Widget>[
                new Flexible(
                  child: new TextField(
                    controller: textEditingController,
                    onSubmitted: _handleSubmitted,
                    decoration: new InputDecoration.collapsed(
                        hintText: "What's on your mind!"),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.symmetric(horizontal: 1.0),
                  child: new IconButton(
                      icon: new Icon(Icons.send),
                      iconSize: 25.0,
                      color: Colors.red,
                      onPressed: () =>
                          _handleSubmitted(textEditingController.text)),
                )
              ],
            )));
  }

  void _handleSubmitted(String text) {
    textEditingController.clear();
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  ChatMessage(this.text);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
              margin: EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(_name[0]))

          ),

          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name, style: Theme
                  .of(context)
                  .textTheme
                  .subhead,
              ),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text),
              )

            ],
          )
        ],
      ),

    )
  }
}
