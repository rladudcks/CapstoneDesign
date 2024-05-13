import 'package:flutter/material.dart';

class BusMyCourtScreen extends StatelessWidget {
  const BusMyCourtScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('앱바 영역'),
      ),
      body: Container(
        color: Colors.green,
        child: Center(
          child: Text(
            '등록한 코트 조회 화면',
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
