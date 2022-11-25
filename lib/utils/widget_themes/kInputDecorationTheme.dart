import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class kInputDecorationTheme {

  static InputDecorationTheme darkInputDecorationTheme = const InputDecorationTheme(
      border: OutlineInputBorder(),
    labelStyle:
    TextStyle(color: kPrimaryColor, fontFamily: 'patrick', fontSize: 20),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
          width: 3.0, color: CupertinoColors.systemGrey4),
    ),
  );


}