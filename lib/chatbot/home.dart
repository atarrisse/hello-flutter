import 'package:flutter/material.dart';
import 'package:hello_flutter/chatbot/components/character/character.dart';

class Home extends StatelessWidget {
  // const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Home"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SafeArea(
            child: Container(padding: EdgeInsets.all(20), child: Character())));
  }
}
