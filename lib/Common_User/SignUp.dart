import 'package:flutter/material.dart';
import 'package:tennis_login/User/UserSignUp.dart';




class SignUp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('회원가입'),
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Text(
                '계정 유형을\n선택해주세요',
                  style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 20,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        height: 0,
                        letterSpacing: -0.20,
                  )),
            //일반 사용자 버튼
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFF464EFF)),
                  borderRadius: BorderRadius.circular(20))
              ),
              onPressed: () {
                Navigator.push(
                    context, new MaterialPageRoute(builder: (context) => UserSignUp()));
              },
              child: Text(
                      '일반 사용자',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF464EFF),
                          fontSize: 10,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: -0.10,
                ),),
            ),
            //테니스 사업자 버튼
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF464EFF)),
                      borderRadius: BorderRadius.circular(20))
              ),
              onPressed: () {

              },
              child: Text(
                      '테니스 사업자',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF464EFF),
                          fontSize: 10,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: -0.10,
                ),),
            ),
            //시스템 관리자 버튼
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF464EFF)),
                      borderRadius: BorderRadius.circular(20))
              ),
              onPressed: () {

              },
              child: Text(
                      '시스템 관리자',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF464EFF),
                          fontSize: 10,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: -0.10,
                ),),
            ),
            ]
      )
    );
  }
}