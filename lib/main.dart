import 'package:flutter/material.dart';
import './chapter3/home.dart';

void main() {
  runApp(new HelloFlutterApp());
}

class HelloFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Chapter 3",
        theme: new ThemeData(
          scaffoldBackgroundColor:
              Color.fromRGBO(230, 230, 230, 1.0),
          // primaryColor: Color.fromRGBO(0, 139, 179, 1.0),
          primaryColor: Color.fromRGBO(129, 204, 204, 1.0),
        ),
        home: new Home());
  }
}
