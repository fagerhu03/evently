import 'package:flutter/material.dart';
import 'package:evently/core/colors/light_colors.dart';
import 'package:evently/core/colors/main_colors.dart';

final MainColors colors = LightColors();

class AppTheming {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFFF2FEFF),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFF2FEFF),
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF5669FF),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    ),

    textTheme: TextTheme(),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: colors.error200,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue.shade50,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(),

    textTheme: TextTheme(),
  );
}
