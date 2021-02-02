// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key, title}) : super(key: key);

  @override
  _ChatPage createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Chat Page")
        ],
      ),
    );
  }
}