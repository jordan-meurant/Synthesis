import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/colors.dart';
import '../../constants/text_strings.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: kLogoutBgColor, width: 2)),
          onPressed: () {},
          icon: const Icon(FontAwesomeIcons.doorOpen, color: kLogoutBgColor,),
          label: const Text(kLogout,
              style: TextStyle(
                  fontSize: 25,
                  color: kLogoutBgColor))),
    );
  }
}