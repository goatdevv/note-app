import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static const TextStyle titleAppBarStyle = TextStyle(
      height: 1.172,
      fontWeight: FontWeight.w500,
      color: Color(0xff000000),
      fontSize: 24);
  static const TextStyle titleStyle = TextStyle(
    height: 1.5,
    fontWeight: FontWeight.w500,
    color: Color(0xff000000),
    fontSize: 16,
  );
  static const TextStyle notesStyle = TextStyle(
    height: 1.5,
    fontWeight: FontWeight.w400,
    color: Color(0xff323232),
    fontFamily: 'TNR',
    fontStyle: FontStyle.normal,
  );
}
