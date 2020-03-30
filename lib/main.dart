import 'package:flutter/material.dart';
import './theme/theme.dart';
import './views/chat.dart';
import './views/home.dart';

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
