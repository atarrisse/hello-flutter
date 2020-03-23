import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Home"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SafeArea(
            child: Center(
                child: RaisedButton(
          onPressed: () {
            print("hi");
            Navigator.pushNamed(context, '/chat');
          },
          child: Text("Chatbot"),
        ))));
  }
}
