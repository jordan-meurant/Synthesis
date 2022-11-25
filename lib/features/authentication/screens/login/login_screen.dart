import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:synthesis/features/authentication/screens/widgets/or_divider_widget.dart';
import 'package:synthesis/links/link.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/routes.dart';
import '../forget_password/forget_password_btn_widget.dart';
import '../forget_password/forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? _checkbox = false;

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Connexion",
                style: Theme.of(context).textTheme.headline2,
              ),
              Form(
                child: Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 10,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Email"),
                        prefixIcon: Icon(Icons.mail_rounded),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Mot de passe"),
                        prefixIcon: Icon(Icons.lock_open_rounded),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Link(
                        "Mot de passe oublié ?",
                        () {
                          ForgetPasswordScreen.buildModalOptionsForgetPassword(context);
                        },
                        kBigLink,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        // <-- Icon
                        Icons.login_rounded,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Connexion',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'patrick'),
                        ),
                      )
                    ],
                  )),
              const OrDividerWidget(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CupertinoColors.white),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage("assets/img/google_logo.png"),
                        height: 25.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Connexion avec Google',
                          style: TextStyle(
                              fontSize: 25,
                              color: CupertinoColors.darkBackgroundGray,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'patrick'),
                        ),
                      )
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Pas de compte ?",
                    style: kFormText,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Link("Crée-le !", () {
                      Navigator.pushNamed(context, registerScreen);
                    }, kBigLink),
                  )
                ],
              )
              // Note: Same code is applied for the TextFormField as well
            ],
          ),
        ),
      ),
    );
  }

}
