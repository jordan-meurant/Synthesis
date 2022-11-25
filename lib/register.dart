import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synthesis/utils/routes.dart';

import 'constants/colors.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool? _checkbox = false;

  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'ou',
              style: TextStyle(
                fontFamily: "satisfy",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                child: Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 10,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Nom"),
                          prefixIcon: Icon(Icons.person_outline),
                          ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Prénom"),
                          prefixIcon: Icon(Icons.person_outline),
                          ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Email"),
                          prefixIcon: Icon(Icons.mail_rounded),
                          ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Numéro de téléphone"),
                          prefixIcon: Icon(Icons.phone),
                          ),
                    ),
                    TextFormField(
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
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side:  BorderSide(
                          color: kPrimaryColor)),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        // <-- Icon
                        Icons.app_registration_rounded,
                        color: kPrimaryColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Inscription',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'patrick'),
                        ),
                      )
                    ],
                  )),
              orDivider(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, loginScreen);
                  },
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

              // Note: Same code is applied for the TextFormField as well
            ],
          ),
        ),
      ),
    );
  }
}
