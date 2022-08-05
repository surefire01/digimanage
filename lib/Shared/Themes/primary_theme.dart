import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

ThemeData primaryTheme = ThemeData(
  cardTheme: CardTheme(
    elevation: 0,
    margin: EdgeInsets.all(0)

  ),
    listTileTheme: ListTileThemeData(

      shape: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none)),
    ),
    textTheme: const TextTheme(),
    iconTheme: const IconThemeData(color: Colors.blue),

    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 3,
      shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.blue),
    ),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
    ),
    inputDecorationTheme: forSignIn,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.blue,
    selectedItemColor: Colors.pink,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.white,
    elevation: 0.0,

  ),

);









// Input Decoration Theme for sign up and sign in
InputDecorationTheme forSignIn = InputDecorationTheme(
  contentPadding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
  fillColor: Colors.grey[200],
  filled: true,
  border: toMakeBorderNone,
  focusedBorder: toMakeBorderNone,
  enabledBorder: toMakeBorderNone,
);

InputBorder toMakeBorderNone = OutlineInputBorder(
    borderSide: BorderSide(width: 0, style: BorderStyle.none),
    borderRadius: BorderRadius.all(Radius.circular(12)));


InputDecoration forCreate = InputDecoration(
  isCollapsed: true,
);


