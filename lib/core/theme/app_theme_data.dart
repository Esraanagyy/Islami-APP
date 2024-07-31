import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static const Color primaryColor = Color(0xffB7935F);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 100,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color(0xff242424),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xff000000),
        selectedIconTheme: IconThemeData(
          color: Color(0xff000000),
          size: 35,
        ),
        selectedLabelStyle: TextStyle(
          fontFamily: "ElMessiri",
          fontSize: 13,
          fontWeight: FontWeight.w800,
        ),
        //showUnselectedLabels: false,
        unselectedItemColor: Color(0xffffffff),
        unselectedIconTheme: IconThemeData(
          color: Color(0xffffffff),
          size: 28,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: "ElMessiri",
          fontSize: 11,
          fontWeight: FontWeight.w800,
        )),
    dividerTheme: const DividerThemeData(
      color: primaryColor,
      thickness: 1,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color(0xff242424),
      ),
      bodyLarge: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Color(0xff242424),
      ),
      bodyMedium: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Color(0xff242424),
      ),
      bodySmall: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Color(0xff242424),
      ),
    ),
  );
}
