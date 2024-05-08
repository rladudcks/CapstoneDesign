import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class TennisMatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('앱바 영역'),
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            '테니스 매치 화면',
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
