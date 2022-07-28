import 'package:flutter/material.dart';

const appPurple = Color.fromARGB(255, 53, 160, 129);
const appWhite = Color(0xfffAF8FC);
const appPurpleDark = Color(0xff206350);
const appPurpleDark2 = Color.fromARGB(255, 22, 66, 54);
const appPurpleLight = Color(0xff86C4CC);
const appPurpleLight2 = Color.fromARGB(255, 126, 189, 197);
const appOrange = Color(0xffE6704A);
const darkBg = Color(0xff161918);

// ThemeData themeLight = ThemeData(
//   brightness: Brightness.light,
//   floatingActionButtonTheme: FloatingActionButtonThemeData(
//     backgroundColor: appPurpleDark,
//   ),
//   primaryColor: appPurple,
//   scaffoldBackgroundColor: Colors.white,
//   appBarTheme: AppBarTheme(
//     elevation: 4,
//     backgroundColor: appPurple,
//   ),
//   textTheme: TextTheme(
//     bodyText1: TextStyle(color: appPurpleDark),
//     bodyText2: TextStyle(color: appPurpleDark),
//   ),
// );
// ThemeData themeDark = ThemeData(
//   brightness: Brightness.dark,
//   floatingActionButtonTheme: FloatingActionButtonThemeData(
//     backgroundColor: appWhite,
//   ),
//   primaryColor: appPurpleLight,
//   scaffoldBackgroundColor: appPurpleDark,
//   appBarTheme: AppBarTheme(
//     elevation: 0,
//     backgroundColor: appPurpleDark,
//   ),
//   textTheme: TextTheme(
//     bodyText1: TextStyle(color: appWhite),
//     bodyText2: TextStyle(color: appWhite),
//   ),
// );

class Themes {
  final LightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: appPurpleDark,
    ),
    primaryColor: appPurple,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      elevation: 4,
      backgroundColor: appPurple,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: appPurpleDark,
      unselectedLabelColor: appPurpleLight,
      // indicator: BoxDecoration(
      //   color: appPurpleDark,
      // ),
    ),

    // textTheme: TextTheme(
    //   bodyText1: TextStyle(color: appPurpleDark),
    //   bodyText2: TextStyle(color: appPurpleDark),
    // ),
  );
  final DarkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: appWhite,
    ),
    primaryColor: darkBg,
    scaffoldBackgroundColor: darkBg,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: darkBg,
    ),
    // textTheme: TextTheme(
    //   bodyText1: TextStyle(color: appWhite),
    //   bodyText2: TextStyle(color: appWhite),
    // ),
    tabBarTheme: TabBarTheme(
      labelColor: appWhite,
      unselectedLabelColor: Colors.grey,

      // indicator: BoxDecoration(
      //   color: appWhite,
      // ),
    ),
  );
}
