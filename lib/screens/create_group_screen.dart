import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:synthesis/constants/text_strings.dart';
import 'package:synthesis/controllers/group_controller.dart';
import 'package:synthesis/partials/buttons/icon_button.dart';
import 'package:synthesis/partials/links/link.dart';

class CreateGroupScreen extends StatelessWidget {
  const CreateGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<GroupController>();

    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 25),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                kCreateGroup,
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      kUseGroupCode,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller.groupName,
                      decoration: const InputDecoration(
                        label: Text(kGroupName),
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
                      title: kCreateGroup,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          GroupController.instance.createGroup(controller.groupName.text.trim());
                        } else {
                          print("ERROR FORM CREATE GROUP");
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(kNoMood),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Link(kJoinGroup, () {}),
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
