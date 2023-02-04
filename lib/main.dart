import 'package:flutter/material.dart';
import 'math.dart';
import 'home.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'home': (context) => Home(),
        'math': (context) => Mathquiz(),
        'res': (context) => Result(),
      },
      initialRoute: 'home',
    );
  }
}
