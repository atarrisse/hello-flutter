import 'package:flutter/material.dart';
import './chatbot/theme/theme.dart';
import './chatbot/home.dart';

void main() {
  runApp(new HelloFlutterApp());
}

class HelloFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Fluter App", theme: CustomTheme.buildTheme(), home: new Home());
  }
}
