import 'package:flutter/material.dart';
import './chatbot/theme/theme.dart';
import './chatbot/chat.dart';
import './chatbot/home.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => Home(),
    '/chat': (context) => Chat(),
  }));
}

class HelloFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Fluter App", theme: CustomTheme.buildTheme(), home: new Home());
  }
}
