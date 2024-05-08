import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TennisMatch extends StatefulWidget {
  @override
  _TennisMatchState createState() => _TennisMatchState();
}

class _TennisMatchState extends State<TennisMatch> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Container(
            color: Colors.blue[10],
            child: Center(
              child: Text(
                'Indexed Stack 1',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          Container(
            color: Colors.blue[10],
            child: Center(
              child: Text(
                'Indexed Stack 2',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          Container(
            color: Colors.blue[10],
            child: Center(
              child: Text(
                'Indexed Stack 3',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          Container(
            color: Colors.blue[10],
            child: Center(
              child: Text(
                'Indexed Stack 4',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          Container(
            color: Colors.blue[10],
            child: Center(
              child: Text(
                'Indexed Stack 5',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: '테니스 매칭',
              icon: Icon(
                CupertinoIcons.game_controller,
              ),
            ),
            BottomNavigationBarItem(
              label: '무인 심판',
              icon: Icon(
                CupertinoIcons.camera,
              ),
            ),
            BottomNavigationBarItem(
              label: '채팅',
              icon: Icon(
                CupertinoIcons.chat_bubble,
              ),
            ),
            BottomNavigationBarItem(
              label: '커뮤니티',
              icon: Icon(
                CupertinoIcons.globe,
              ),
            ),
            BottomNavigationBarItem(
              label: '마이페이지',
              icon: Icon(
                CupertinoIcons.person,
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex),
    );
  }
}
