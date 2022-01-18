import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  static ThemeData themeProfD1 = ThemeData(
    primarySwatch: Colors.teal,
    primaryColor: Colors.teal,
    textTheme:  TextTheme(
      headline1: TextStyle(
        fontSize: 15.0.sp,
        fontWeight: FontWeight.bold,
        color: Colors.teal
      ),
        headline2: TextStyle(
        fontSize: 15.0.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),
        bodyText1: const TextStyle(
          fontSize: 23,
        ),
        bodyText2: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
  );
}
