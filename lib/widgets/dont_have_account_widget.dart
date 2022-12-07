import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:synthesis/partials/links/link.dart';

import '../constants/colors.dart';
import '../constants/text_strings.dart';
import '../screens/signup_screen.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    Key? key,
  }) : super(key: key);

  static const kFormText = TextStyle(
    color: CupertinoColors.systemGrey4,
    fontSize: 20,
    decoration: TextDecoration.none,
  );

  static const kBigLink = TextStyle(
    color: kPrimaryColor,
    fontSize: 20,
    fontStyle: FontStyle.italic,
    decoration: TextDecoration.none,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          kDontHaveAccount,
          style: kFormText,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Link(kCreateIt, () {
            Get.to(() => const SignUpScreen());
          }, style: (kBigLink)),
        )
      ],
    );
  }
}
