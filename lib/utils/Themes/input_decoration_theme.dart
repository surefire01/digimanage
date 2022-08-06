import 'package:flutter/material.dart';

// Input Decoration Theme for sign up and sign in
InputDecorationTheme forSignIn = InputDecorationTheme(
  contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
  fillColor: Colors.grey[200],
  filled: true,
  border: toMakeBorderNone,
  focusedBorder: toMakeBorderNone,
  enabledBorder: toMakeBorderNone,
);

InputBorder toMakeBorderNone = const OutlineInputBorder(
    borderSide: BorderSide(width: 0, style: BorderStyle.none),
    borderRadius: BorderRadius.all(Radius.circular(12)));

InputDecoration forCreate = InputDecoration(
  isCollapsed: true,
);
