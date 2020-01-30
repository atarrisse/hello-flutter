import 'package:flutter/material.dart';
import 'chapter3/theme.dart';
import './chapter3/home.dart';

void main() {
  runApp(new HelloFlutterApp());
}

class HelloFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Chapter 3",
        theme: CustomTheme.buildTheme(),
        home: new Home());
  }
}
