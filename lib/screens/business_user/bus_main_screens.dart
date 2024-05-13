import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tennis_jamiss/screens/business_user/bus_my_court.dart';
import 'package:tennis_jamiss/screens/business_user/bus_my_page.dart';
import 'package:tennis_jamiss/screens/business_user/bus_payments.dart';

class BusMainScreens extends StatefulWidget {
  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<BusMainScreens> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          BusMyCourtScreen(),
          BusPaymentScreen(),
          BusMyPageScreen(),
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
              label: '조회', icon: Icon(CupertinoIcons.sportscourt)),
          const BottomNavigationBarItem(
              label: '정산', icon: Icon(CupertinoIcons.money_dollar_circle)),
          const BottomNavigationBarItem(
              label: '마이 페이지', icon: Icon(CupertinoIcons.person)),
        ],
      ),
    );
  }
}
