import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:synthesis/constants/text_strings.dart';

import '../constants/colors.dart';
import '../partials/buttons/icon_button.dart';
import '../utils/routes.dart';
import '../widgets/or_divider_widget.dart';
import 'package:get/get.dart';
class ResetPasswordByEmailScreen extends StatelessWidget {
  const ResetPasswordByEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/img/password.png",
                  height: MediaQuery.of(context).size.height * 0.2),
              Text(
                kResetPassword,
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(kEmail),
                    prefixIcon: Icon(Icons.mail_rounded),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomIconButton(
                  icon: Icon(FontAwesomeIcons.solidPaperPlane), title: kSend),
              const OrDividerWidget(),
               CustomIconButton(
                  icon: const Icon(FontAwesomeIcons.backward), title: kBackToHomePage, onPressed: (){
                    Get.back();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
