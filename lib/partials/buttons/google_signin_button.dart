import 'package:flutter/cupertino.dart';

import '../../constants/text_strings.dart';
import '../../controllers/authentication_controller.dart';
import 'image_button.dart';

class GoogleSignUpButton extends StatelessWidget {
  const GoogleSignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageButton(
        imageURL: 'assets/img/google_logo.png',
        title: kGoogleLogin,
        onPressed: () {
          AuthenticationController.instance.signInWithGoogle();
        });
  }
}
