import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:synthesis/features/authentication/controllers/signup_controller.dart';

import '../../../../widgets/or_divider_widget.dart';
import 'constants/colors.dart';

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
              Text(
                "Inscription",
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
                        label: Text("Nom"),
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    TextFormField(
                      controller: controller.firstName,
                      decoration: const InputDecoration(
                        label: Text("Prénom"),
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    TextFormField(
                      controller: controller.email,
                      decoration: const InputDecoration(
                        label: Text("Email"),
                        prefixIcon: Icon(Icons.mail_rounded),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: controller.phoneNo,
                      decoration: const InputDecoration(
                        label: Text("Numéro de téléphone"),
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: controller.password,
                      decoration: const InputDecoration(
                        label: Text("Mot de passe"),
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
                  const Text(
                    "Accepter les termes & conditions",
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    print("ho YES");
                    if (formKey.currentState!.validate()) {
                      print("BIG YES");
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
                  label: const Text(
                    'Inscription',
                    style: TextStyle(fontSize: 25, color: kPrimaryColor),
                  ),
                ),
              ),
              const OrDividerWidget(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.arrowRightToBracket),
                  label: Text('Connexion',
                      style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.secondary)),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CupertinoColors.white),
                  icon: const Image(
                    image: AssetImage("assets/img/google_logo.png"),
                    height: 25,
                  ),
                  label: Text('Connexion avec Google',
                      style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.secondary)),
                ),
              ),

              // Note: Same code is applied for the TextFormField as well
            ],
          ),
        ),
      ),
    );
  }
}
