import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synthesis/utils/widget_themes/TTextTheme.dart';
import 'package:synthesis/utils/widget_themes/kInputDecorationTheme.dart';

import '../constants/colors.dart';

class TAppTheme {
  // make theme private
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "patrick",
    colorScheme:  const ColorScheme.light(
      primary: kPrimaryColor,
    ),
    textTheme: TTextTheme.lightTextTheme,
    iconTheme: const IconThemeData(
      color: kPrimaryColor,
    ),
      inputDecorationTheme: kInputDecorationTheme.darkInputDecorationTheme
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
    primaryColorDark: CupertinoColors.systemRed,
      brightness: Brightness.dark,
      fontFamily: "patrick",
      colorScheme:  const ColorScheme.dark(
        primary: kPrimaryColor,
      ),
      textTheme: TTextTheme.darkTextTheme,
    iconTheme: const IconThemeData(
      color: kPrimaryColor,

    ),
  inputDecorationTheme: kInputDecorationTheme.darkInputDecorationTheme);


/*TextStyle(
  fontSize: 50,
  color: CupertinoColors.darkBackgroundGray,
  fontWeight: FontWeight.w600,
  fontFamily: "satisfy",
  )*/
}
