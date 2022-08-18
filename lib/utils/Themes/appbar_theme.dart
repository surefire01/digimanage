import 'package:flutter/material.dart';
import 'package:digimanage/utils/Themes/text_theme.dart';

 AppBarTheme appBarTheme = AppBarTheme(
  elevation: 0,
  centerTitle: true,
  scrolledUnderElevation: 3,
  shape: Border(bottom: BorderSide(color: Colors.grey[100]!, width: 1.5)),
  backgroundColor: Colors.white,
  titleTextStyle: textTheme.titleMedium!.copyWith(color: Colors.blue,fontWeight: FontWeight.bold),
  iconTheme: IconThemeData(color: Colors.blue),
);