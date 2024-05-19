import 'package:flutter/material.dart';
import 'package:tennis_jamiss/main.dart';
import 'package:tennis_jamiss/screens/referee/ready_referee_screen.dart';

class RefereeScreen extends StatefulWidget {
  // 무인 심판 첫 화면
  static const routeName = '/RefereeScreen';

  const RefereeScreen({Key? key}) : super(key: key);

  @override
  RefereeScreenState createState() => RefereeScreenState();
}

class RefereeScreenState extends State<RefereeScreen> {

  @override
  Widget build(BuildContext context) {
        return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.videocam_outlined,
                  size: 100,
                  color: Colors.black,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "무인심판을\n시작합니다",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: -0.26,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text("스마트폰을 가로로 거치해주세요!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: -0.14,
                    )),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text(
                    '시작하기',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReadyToRefereeScreen(camera: cameras.first,)));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: Size(200, 50),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ]),
        );
  }
}
