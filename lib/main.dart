import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:tennis_login/login_and_signup/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TennisJamiss',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: LogIn(key: UniqueKey())
    );
  }
}


