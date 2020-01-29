import 'package:flutter/material.dart';
import './chapter2/home.dart';

void main() {
  runApp(new HelloFlutterApp());
}

class HelloFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Simple Layouts", home: new Home());
  }
}
