import 'package:flutter/material.dart';

class MyPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('앱바 영역'),
      ),
      body: Container(
        color: Colors.indigoAccent,
        child: Center(
          child: Text(
            '마이 페이지 화면',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              //추후 textTheme().displayMedium, 처리해야함
            ),
          ),
        ),
      ),
    );
  }
}
