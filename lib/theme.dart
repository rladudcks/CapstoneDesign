import 'package:flutter/material.dart';

// TextTheme textTheme() {}

// IconThemeData iconTheme() {}

// AppBarTheme appBarTheme() {}

BottomNavigationBarThemeData bottomNavigationBarTheme() {
  return const BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFF474EFF),
    unselectedItemColor: Color(0xFFD9D9D9),
    showUnselectedLabels: true,
  );
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    // textTheme: textTheme(),
    // appBarTheme: appBarTheme(),
    bottomNavigationBarTheme: bottomNavigationBarTheme(),
    primarySwatch: Colors.blue,
  );
}
