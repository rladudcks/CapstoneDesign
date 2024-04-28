import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:tennis_login/Common_User/LogIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: LogIn(key: key)
    );
  }
}


