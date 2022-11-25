import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
    headline2: TextStyle(
      color: kPrimaryColor,
      fontFamily: 'satisfy',
    ),
    subtitle1: TextStyle(
      color: kPrimaryColor,
      fontFamily: 'satisfy',
    ),
    headline3: TextStyle(
      color: kPrimaryColor,
      fontFamily: 'patrick',
        fontSize: 40
    ),
  );
  static TextTheme darkTextTheme = const TextTheme(
    headline2: TextStyle(
      color: kPrimaryColor,
      fontFamily: 'satisfy',
    ),
    subtitle1: TextStyle(
      color: kPrimaryColor,
      fontFamily: 'satisfy',
    ),
    headline3: TextStyle(
      color: kPrimaryColor,
      fontFamily: 'patrick',
      fontSize: 40
    ),
  );
}
