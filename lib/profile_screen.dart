import 'package:avatars/avatars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:synthesis/constants/colors.dart';
import 'package:synthesis/profile_controller.dart';
import 'package:synthesis/repository/authentication_controller.dart';

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
                        'Numéro de téléphone : ${controller.userProfile.value?.phoneNo}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        'Email : ${controller.userProfile.value?.email}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        AuthenticationController.instance.logout();
                      },
                      icon: const Icon(FontAwesomeIcons.doorOpen),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kLogoutBgColor),
                      label: Text('Déconnexion',
                          style: TextStyle(
                              fontSize: 25,
                              color: Theme.of(context).colorScheme.secondary)),
                    ),
                  ),
                ],
              )
            : CircularProgressIndicator()),
      ),
    ));
  }
}
