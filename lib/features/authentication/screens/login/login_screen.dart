import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synthesis/links/link.dart';
import '../../../../widgets/or_divider_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/routes.dart';
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
                          ForgetPasswordScreen.buildModalOptionsForgetPassword(
                              context);
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.arrowRightToBracket),
                  label:  Text('Connexion',
                      style: TextStyle(fontSize: 25, color: Theme.of(context).colorScheme.secondary)),
                ),
              ),
              const OrDividerWidget(),
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
                  label:  Text('Connexion avec Google',
                      style: TextStyle(fontSize: 25, color: Theme.of(context).colorScheme.secondary)),
                ),
              ),
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
              ),
              // Note: Same code is applied for the TextFormField as well
            ],
          ),
        ),
      ),
    );
  }
}
