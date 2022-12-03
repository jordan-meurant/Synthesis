import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synthesis/utils/widget_themes/TTextTheme.dart';
import 'package:synthesis/utils/widget_themes/kInputDecorationTheme.dart';

import '../constants/colors.dart';

class TAppTheme {
  // make them private
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    backgroundColor: kLightBgColor,
      brightness: Brightness.light,
      fontFamily: "patrick",
      colorScheme: const ColorScheme.light(
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
        tertiary: kSecondaryColor
      ),
      textTheme: TTextTheme.lightTextTheme,
      iconTheme: const IconThemeData(
        color: kPrimaryColor,
      ),
      inputDecorationTheme: kInputDecorationTheme.darkInputDecorationTheme,
   );

  static ThemeData darkTheme = ThemeData(
      backgroundColor: kSecondaryColor,
      primaryColorDark: CupertinoColors.systemRed,
      brightness: Brightness.dark,
      fontFamily: "patrick",
      colorScheme: const ColorScheme.dark(
          primary: kPrimaryColor,
          background: kSecondaryColor,
          secondary: kSecondaryColor,
        tertiary: kLightBgColor
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
