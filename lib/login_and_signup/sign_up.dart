import 'package:flutter/material.dart';
import 'package:tennis_login/login_and_signup/user_sign_up.dart';




class SignUp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('회원가입',
          style: TextStyle(
            color: Color(0xFF222222),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
            height: 0,
            letterSpacing: -0.14,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  textAlign: TextAlign.center,
                  "계정 유형을" + '\n' + "선택해주세요",
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 20,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: -0.20,
                  ),
                ),
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(89, 86),
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
                            minimumSize: Size(89, 86),
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
                            minimumSize: Size(89, 86),
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
                ),
              ]
          ),
        )
      )
    );
  }
}