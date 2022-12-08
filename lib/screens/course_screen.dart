import 'package:avatars/avatars.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:synthesis/partials/buttons/icon_button.dart';
import 'package:synthesis/screens/profile_screen.dart';

import '../profile_controller.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    final avatars = [
      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
      "https://avatars.githubusercontent.com/u/46026917?v=4",
      "LoicBourge"
    ];
    final profileController = Get.find<ProfileController>();
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 150,
                      child: CustomIconButton(
                          icon: const Icon(FontAwesomeIcons.backward),
                          title: 'Groupes', onPressed: (){},)),
                  Obx(() => profileController.isLoading.value
                      ? Avatar(
                          onTap: () {
                            Get.to(() => const ProfileScreen());
                          },
                          sources: [
                            NetworkSource(
                                profileController.userProfile.value?.imageURL ??
                                    '')
                          ],
                          name:
                              profileController.userProfile.value?.displayName,
                          shape: AvatarShape.circle(25))
                      : const CircularProgressIndicator())
                ],
              ),
              const SizedBox(height: 10),
              const TransparentImageCard(
                endColor: CupertinoColors.systemYellow,
                width: double.infinity,
                imageProvider: NetworkImage(
                    "https://learning.oilab.in/public/img/Flutter-course-in-jodhpur.png"),
                title: Text("Flutter"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CupertinoColors.white),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage("assets/img/chat_icon.png"),
                        height: 50,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Posez vos questions !',
                          style: TextStyle(
                              fontSize: 25,
                              color: CupertinoColors.darkBackgroundGray,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'patrick'),
                        ),
                      )
                    ],
                  )),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Ressources",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Image.asset("assets/icons/icon-add-file.png", height: 50),
                ],
              ),
              const SizedBox(height: 10),
              CarouselSlider(
                items: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/img/file.png",
                        height: 100,
                      ),
                      Text(
                        "namefile.pdf",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/img/file.png",
                        height: 100,
                      ),
                      Text(
                        "namefile2.pdf",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/img/file.png",
                        height: 100,
                      ),
                      Text(
                        "namefile3.pdf",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ],
                options: CarouselOptions(
                  height: 150,
                  viewportFraction: 0.3,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Notes :",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Image.asset("assets/icons/icon-add-notes.png", height: 50),
                ],
              ),
              const SizedBox(height: 10),
              CarouselSlider(
                items: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/img/note.png",
                      ),
                      Text(
                        "namefile.pdf",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/img/note.png",
                      ),
                      Text(
                        "namefile2.pdf",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/img/note.png",
                      ),
                      Text(
                        "namefile3.pdf",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ],
                options: CarouselOptions(
                  viewportFraction: 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
