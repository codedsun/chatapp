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
class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  List<ChatMessage> _messages = <ChatMessage>[];
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
        body: new Column(children: <Widget>[
          new Flexible(
              child: ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          )),
          new Divider(height: 1.0),
          new Container(
              decoration: new BoxDecoration(color: Theme.of(context).cardColor),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              height: 50.0,
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
              )),
        ]));
  }

  void _handleSubmitted(String text) {
    textEditingController.clear();
    ChatMessage message = new ChatMessage(text, new AnimationController(vsync: this, duration: new Duration(milliseconds: 800)));
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  @override
  void dispose() {
    for(ChatMessage message in _messages){
      message.animationController.dispose();
      super.dispose();
    }
  }

}

class ChatMessage extends StatelessWidget {
  final String text;

  final AnimationController animationController;

  ChatMessage(this.text, this.animationController);

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(sizeFactor: new CurvedAnimation(parent: animationController, curve: Curves.easeOut), axisAlignment: 0.0,
    child:  new Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
              margin: EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(
                  backgroundImage: new NetworkImage("https://scontent.fdel11-1.fna.fbcdn.net/v/t31.0-8/22905021_1597683153625147_3956039958511108406_o.jpg?_nc_cat=0&oh=e418b738c60685f329c0dd5cc4105023&oe=5C0340B7"))),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                _name,
                style: Theme.of(context).textTheme.subhead,
              ),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text),
              )
            ],
          )
        ],
      ),
    ));
  }
}

