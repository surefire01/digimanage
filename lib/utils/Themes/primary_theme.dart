import 'package:digimanage/utils/Themes/appbar_theme.dart';
import 'package:digimanage/utils//Themes/bottom_navigaitionbar_theme.dart';
import 'package:digimanage/utils//Themes/button_themes.dart';
import 'input_decoration_theme.dart';
import 'package:flutter/material.dart';

import 'input_decoration_theme.dart';

ThemeData primaryTheme = ThemeData(
    cardTheme: CardTheme(elevation: 0, margin: EdgeInsets.all(0)),
    listTileTheme: ListTileThemeData(
      shape:
          OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none)),
    ),
    textTheme: const TextTheme(),
    iconTheme: const IconThemeData(color: Colors.blue),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white, ),
    appBarTheme: appBarTheme,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    elevatedButtonTheme: elevatedButtonThemeData,
    inputDecorationTheme: forSignIn,
    bottomNavigationBarTheme: bottomNavigationBarThemeData,
    //snackBarTheme:
);

