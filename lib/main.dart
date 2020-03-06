import 'package:flutter/material.dart';
import './http/theme/theme.dart';
import './http/home.dart';

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
