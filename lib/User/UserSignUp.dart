import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class UserSignUp extends StatefulWidget {
  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: FormWidget(),
    );
  }
}

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}


class _FormWidgetState extends State<FormWidget> {
  // 텍스트 입력 필드에 입력된 값들을 저장할 변수들
  final user_formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String confirmPassword = '';
  String name = '';
  DateTime user_birthdate = DateTime.now();
  int age = 0;
  String gender = 'Male';
  double ntrp = 1.0;
  final List<bool> user_genderToggle = [true, false];

  //날짜 설정 기능
  final birthdayController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: '2024.01.01',
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        birthdayController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
  //나이 계산
  int calculateAge(DateTime birthdate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthdate.year;
    if (currentDate.month < birthdate.month ||
        (currentDate.month == birthdate.month && currentDate.day < birthdate.day)) {
      age--;
    }
    return age;
  }

      @override
      Widget build(BuildContext context) {
        return Form(
            key: user_formKey,
            child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  // 아이디 입력창
                  TextFormField(
                    onTap: () {
                      // 포커스를 받았을 때 상태 업데이트
                      setState(() {
                      });
                    },
                    // 포커스를 잃었을 때 상태 업데이트
                    onFieldSubmitted: (value) {
                      setState(() {
                      });
                    },
                    controller: TextEditingController(text: name),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '아이디는 공란이어서는 안됩니다.';
                      } else if (value.length < 6 || value.length > 20) {
                        return '아이디는 6-20자 사이여야 합니다.';
                      }
                      return null;
                    },
                    onSaved: (value) => name = value!,
                    decoration: InputDecoration(
                      // 입력창 배경은 회색, 선택할 때 흰색
                        labelText: '아이디',
                        hintText: '아이디를 입력해주세요 (6-20자)',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Color(0xFF464EFF))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                  // 비밀번호 입력창
                  TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호를 입력해주세요';
                      } else if (value.length < 8) {
                        return '비밀번호는 8자 이상이어야 합니다.';
                      }
                      return null;
                    },
                    onSaved: (value) => password = value!,
                    decoration: InputDecoration(
                        labelText: '비밀번호',
                        hintText: '비밀번호를 입력해주세요',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Color(0xFF464EFF))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                  // 비밀번호 확인 칸
                  TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호 확인란을 입력해주세요';
                      } else if (value != password) {
                        return '비밀번호와 일치하지 않습니다.';
                      }
                      return null;
                    },
                    onSaved: (value) => confirmPassword = value!,
                    decoration: InputDecoration(
                        labelText: '비밀번호 확인',
                        hintText: '비밀번호를 한 번 더 입력해주세요',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Color(0xFF464EFF))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red))
                    ),
                  ),
                  // 이름 칸
                  TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '이름을 입력해주세요';
                      }
                      else if (value.length > 10) {
                        return '이름의 길이는 10자 이하여야 합니다.';
                      }
                      return null;
                    },
                    onSaved: (value) => name = value!,
                    decoration: InputDecoration(
                        labelText: '이름',
                        hintText: '이름을 입력해주세요',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Color(0xFF464EFF))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red))
                    ),
                  ),
                  ListTile(
                    title: Text('생년월일'),
                    subtitle: Text(DateFormat('yyyy.MM.dd').format(user_birthdate)),
                    trailing: Icon(Icons.calendar_today),
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: user_birthdate,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null && picked != user_birthdate) {
                        setState(() {
                          user_birthdate = picked;
                          age = calculateAge(picked);
                        });
                      }
                    },
                  ),
                  ToggleButtons(
                    children: <Widget>[Text('남자'), Text('여자')],
                    isSelected: user_genderToggle,
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0; buttonIndex < user_genderToggle.length; buttonIndex++) {
                          if (buttonIndex == index) {
                            user_genderToggle[buttonIndex] = true;
                          } else {
                            user_genderToggle[buttonIndex] = false;
                          }
                        }
                      });
                    },
                  ),
                  DropdownButtonFormField<double>(
                      value: ntrp,
                      decoration: InputDecoration(
                        labelText: '선택하기',
                        border: OutlineInputBorder(),
                      ),
                      items: List<DropdownMenuItem<double>>.generate(
                        7,(index) => DropdownMenuItem(value:(index + 1).toDouble(),
                        child: Text('${(index + 1).toDouble()}'),
                      ),
                      ),
                      onChanged: (double? newValue) {
                        setState(() {
                          ntrp = newValue!;
                        });
                      }
                  ),
                  TextField(
                    controller: user_emailController,
                    decoration: InputDecoration(
                      labelText: '이메일',
                      suffixIcon: isSendingVerification ? CircularProgressIndicator() : ElevatedButton(
                        onPressed: sendVerificationCode,
                        child: Text('인증번호 발송'),
                      ),
                    ),
                  ),
                  TextField(
                    controller: user_verificationCodeController,
                    decoration: InputDecoration(
                      labelText: '인증번호 확인',
                      suffixIcon: isVerifyingCode ? CircularProgressIndicator() : ElevatedButton(
                        onPressed: verifyCode,
                        child: Text('인증번호 확인'),
                      ),
                    ),
                  ),
                ]
            )
        );
      }
}


