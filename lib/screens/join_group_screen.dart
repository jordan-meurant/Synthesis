import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:synthesis/partials/buttons/icon_button.dart';
import 'package:synthesis/partials/links/link.dart';

class JoinGroupScreen extends StatelessWidget {
  const JoinGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 25),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Rejoins un groupe !",
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      "Utilises le code de groupe qu'on t'a filé pour rejoindre ce groupe",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Code de groupe"),
                        prefixIcon: Icon(FontAwesomeIcons.fingerprint),
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  CustomIconButton(
                      icon: const Icon(FontAwesomeIcons.peopleGroup),
                      title: "Rejoins un groupe !",
                      onPressed: () {}),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Pas de code ?",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Link("Crée ton groupe !", () {

                        }, ),
                      )
                    ],
                  ),
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
