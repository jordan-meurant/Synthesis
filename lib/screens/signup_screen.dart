import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:synthesis/constants/text_strings.dart';
import 'package:synthesis/controllers/signup_controller.dart';
import 'package:synthesis/screens/login_screen.dart';
import 'package:synthesis/partials/buttons/google_signin_button.dart';

import '../../../../widgets/or_divider_widget.dart';
import '../constants/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? _checkbox = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(kSignup,
                style: Theme.of(context).textTheme.headline2,
              ),
              Form(
                key: formKey,
                child: Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 10,
                  children: [
                    TextFormField(
                      controller: controller.lastName,
                      decoration: const InputDecoration(
                        label: Text(kLastName),
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    TextFormField(
                      controller: controller.firstName,
                      decoration: const InputDecoration(
                        label: Text(kFirstName),
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    TextFormField(
                      controller: controller.email,
                      decoration: const InputDecoration(
                        label: Text(kEmail),
                        prefixIcon: Icon(Icons.mail_rounded),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: controller.phoneNo,
                      decoration: const InputDecoration(
                        label: Text(kPhoneNo),
                        prefixIcon: Icon(Icons.phone),
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
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor: kPrimaryColor,
                    value: _checkbox,
                    onChanged: (bool? value) {
                      setState(() {
                        _checkbox = value;
                      });
                    },
                  ),
                  const Text(kTermsAndConditions,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      SignUpController.instance.registerUser(
                          controller.lastName.text.trim(),
                          controller.firstName.text.trim(),
                          controller.phoneNo.text.trim(),
                          controller.email.text.trim(),
                          controller.password.text.trim());
                    } else {
                      print("ERROR FORM");
                    }
                  },
                  icon: const Icon(FontAwesomeIcons.userPlus),
                  label: const Text(kSignup,
                    style: TextStyle(fontSize: 25, color: kPrimaryColor),
                  ),
                ),
              ),
              const OrDividerWidget(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.to(()=> const LoginScreen());
                  },
                  icon: const Icon(FontAwesomeIcons.arrowRightToBracket),
                  label: Text(kLogin,
                      style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.secondary)),
                ),
              ),
              const GoogleSignUpButton()
              // Note: Same code is applied for the TextFormField as well
            ],
          ),
        ),
      ),
    );
  }
}
