import 'package:avatars/avatars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:synthesis/constants/colors.dart';
import 'package:synthesis/profile_controller.dart';
import 'package:synthesis/repository/authentication_repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = AuthenticationRepository().user;
    final controller = ProfileController();
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Avatar(
                  onTap: () {},
                  sources: [
                    NetworkSource(user.photoURL ?? ""),
                  ],
                  name: user.displayName,
                  shape: AvatarShape.circle(50)),
              Text(
                "controller.userProfile.lastName",
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                user.phoneNumber ?? "Pas de numéro",
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    //AuthenticationRepository.instance.logout();
                    AuthenticationRepository.instance.getUserProfile();
                  },
                  icon: const Icon(FontAwesomeIcons.doorOpen),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: kLogoutBgColor),
                  label: Text('Déconnexion',
                      style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.secondary)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
