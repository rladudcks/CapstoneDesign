import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:tennis_login/login_and_signup/login.dart';
import 'package:tennis_login/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TennisJamiss',
      theme: theme(),
      home: LogIn(key: UniqueKey()),
    );
  }
}
