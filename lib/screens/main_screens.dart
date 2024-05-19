import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tennis_jamiss/main.dart';
import 'package:tennis_jamiss/screens/chatting/chatting_screen.dart';
import 'package:tennis_jamiss/screens/club/club_screen.dart';
import 'package:tennis_jamiss/screens/match/tennis_match_screen.dart';
import 'package:tennis_jamiss/screens/my_page/my_page.dart';
import 'package:tennis_jamiss/screens/referee/referee_screen.dart';

class MainScreens extends StatefulWidget {
  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          TennisMatchScreen(),
          RefereeScreen(),
          ChattingScreen(),
          ClubScreen(),
          MyPageScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
              label: '테니스 매칭', icon: Icon(CupertinoIcons.sportscourt)),
          const BottomNavigationBarItem(
              label: '무인 심판', icon: Icon(CupertinoIcons.camera)),
          const BottomNavigationBarItem(
              label: '채팅', icon: Icon(CupertinoIcons.chat_bubble)),
          const BottomNavigationBarItem(
              label: '동호회', icon: Icon(CupertinoIcons.globe)),
          const BottomNavigationBarItem(
              label: '마이 페이지', icon: Icon(CupertinoIcons.person)),
        ],
      ),
    );
  }
}
