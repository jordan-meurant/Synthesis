import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:synthesis/constants/text_strings.dart';
import 'package:synthesis/partials/buttons/icon_button.dart';
import 'package:synthesis/partials/buttons/image_button.dart';
import 'package:synthesis/partials/links/link.dart';
import 'package:synthesis/controllers/authentication_controller.dart';

import '../constants/colors.dart';
import '../utils/routes.dart';
import '../widgets/or_divider_widget.dart';
import '../controllers/signin_controller.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final formKey = GlobalKey<FormState>();
    bool? _checkbox = false;
    const kBigLink = TextStyle(
      color: kPrimaryColor,
      fontSize: 20,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.none,
    );
    const kFormText = TextStyle(
      color: CupertinoColors.systemGrey4,
      fontSize: 20,
      decoration: TextDecoration.none,
    );
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                kLogin,
                style: Theme.of(context).textTheme.headline2,
              ),
              Form(
                key: formKey,
                child: Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 10,
                  children: [
                    TextFormField(
                      controller: controller.email,
                      decoration: const InputDecoration(
                        label: Text(kEmail),
                        prefixIcon: Icon(Icons.mail_rounded),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: controller.password,
                      decoration: const InputDecoration(
                        label: Text(kPassword),
                        prefixIcon: Icon(Icons.lock_open_rounded),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Link(
                        kForgetPassword,
                        () {
                          ForgetPasswordScreen.buildModalOptionsForgetPassword(
                              context);
                        },
                        style: kBigLink,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomIconButton(
                  icon: const Icon(FontAwesomeIcons.arrowRightToBracket),
                  title: kLogin,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      SignInController.instance.login(
                          controller.email.text.trim(),
                          controller.password.text.trim());
                    }
                  }),
              const OrDividerWidget(),
              ImageButton(
                  imageURL: 'assets/img/google_logo.png',
                  title: kGoogleLogin,
                  onPressed: () {
                    AuthenticationController.instance.signInWithGoogle();
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    kDontHaveAccount,
                    style: kFormText,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Link(kCreateIt, () {
                      Navigator.pushNamed(context, registerScreen);
                    }, style: kBigLink),
                  )
                ],
              ),
              // Note: Same code is applied for the TextFormField as well
            ],
          ),
        ),
      ),
    );
  }
}
