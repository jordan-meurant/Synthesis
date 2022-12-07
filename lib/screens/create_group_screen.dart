import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:synthesis/partials/buttons/icon_button.dart';
import 'package:synthesis/partials/links/link.dart';
import 'package:synthesis/widgets/or_divider_widget.dart';

class CreateGroupScreen extends StatelessWidget {
  const CreateGroupScreen({Key? key}) : super(key: key);

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
                "Crée un groupe !",
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
                        label: Text("Nom du groupe"),
                        prefixIcon: Icon(FontAwesomeIcons.peopleGroup),
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  CustomIconButton(
                      icon: const Icon(FontAwesomeIcons.userPlus),
                      title: "Créer ton groupe !",
                      onPressed: () {}),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Pas envie ?",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Link("Rejoins groupe !", () {

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
