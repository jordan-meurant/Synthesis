import 'package:avatars/avatars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:synthesis/constants/colors.dart';
import 'package:synthesis/partials/buttons/logout_button.dart';
import 'package:synthesis/profile_controller.dart';
import 'package:synthesis/controllers/authentication_controller.dart';

import '../constants/text_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = AuthenticationController.instance.user;
    final controller = Get.put(ProfileController());

    return Scaffold(
        body: SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 25),
      child: Center(
        child: Obx(() => controller.isLoading.value
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Avatar(
                          onTap: () {},
                          sources: [
                            NetworkSource(
                                controller.userProfile.value?.imageURL ?? " ")
                          ],
                          name: '${controller.userProfile.value?.displayName}',
                          shape: AvatarShape.circle(50)),
                      Text(
                        '${controller.userProfile.value?.displayName}',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$kPhoneNo : ${controller.userProfile.value?.phoneNo}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        '$kEmail : ${controller.userProfile.value?.email}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const LogoutButton()
                ],
              )
            : const CircularProgressIndicator()),
      ),
    ));
  }
}



