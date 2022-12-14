import 'package:avatars/avatars.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:synthesis/constants/colors.dart';
import 'package:synthesis/constants/text_strings.dart';
import 'package:synthesis/controllers/group_controller.dart';
import 'package:synthesis/screens/course_screen.dart';
import 'package:synthesis/widgets/group_selection_btn_widget.dart';
import 'package:synthesis/screens/group_options_screen.dart';
import 'package:synthesis/partials/buttons/icon_button.dart';
import 'package:synthesis/profile_controller.dart';
import 'package:synthesis/screens/profile_screen.dart';

import '../../../widgets/or_divider_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO take groups from FIREBASE
    const String nameGroup = "MASI";

    final groupController = Get.put(GroupController());
    final profileController = Get.put(ProfileController());
    final avatars = ["jordan-meurant", "DetrembleurArthur", "LoicBourge"];

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        GroupOptionsScreen.buildModalOptionsJoinGroup(context);
                      },
                      icon: const Icon(FontAwesomeIcons.circlePlus),
                      iconSize: 30),
                  const GroupSelectionBtnWidget(),
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
              const SizedBox(height: 50),
              Text(
                "$kGroup : $nameGroup",
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: "yes"));
                    // TODO take groupCode from firebase
                    Get.snackbar(kGroupCodeCopied, "kmqfjmoqisfhmqsdkfh",
                        snackPosition: SnackPosition.BOTTOM,
                        margin: const EdgeInsets.all(10));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(FontAwesomeIcons.share),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          kGroupCode,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'patrick'),
                        ),
                      )
                    ],
                  )),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    kCourses,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(shape: const CircleBorder()),
                      child: const Icon(FontAwesomeIcons.plus)),
                ],
              ),
              CarouselSlider(
                items:  [
                  GestureDetector(
                    onTap: (){Get.to(()=> const CourseScreen());},
                    child: const TransparentImageCard(
                      endColor: CupertinoColors.systemYellow,
                      width: double.infinity,
                      imageProvider: NetworkImage(
                          "https://learning.oilab.in/public/img/Flutter-course-in-jodhpur.png"),
                      title: Text("Flutter")
                    ),
                  ),
                  const TransparentImageCard(
                    endColor: kPrimaryColor,
                    width: double.infinity,
                    imageProvider: NetworkImage(
                        "https://nasroo.com/wp-content/uploads/2020/06/Top-4-Project-Management-Courses-for-Beginners-2.jpg"),
                    title: Text("Management"),
                  ),
                ],
                options: CarouselOptions(
                  viewportFraction: 0.7,
                  enlargeCenterPage: true,
                  onPageChanged: (index, position) {
                    //setState(() {
                    //_currentMovie = index;
                    //});
                  },
                ),
              ),
              Text(
                kParticipants,
                style: Theme.of(context).textTheme.headline4,
              ),
              CarouselSlider(
                items: avatars
                    .map((avatar) => GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                context: context,
                                builder: (context) => Container(
                                      padding: const EdgeInsets.all(30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Wrap(
                                            spacing: 10,
                                            children: [
                                              Avatar(
                                                  sources: [
                                                    GitHubSource(
                                                        "jordan-meurant")
                                                  ],
                                                  name: "jordan",
                                                  shape:
                                                      AvatarShape.circle(30)),
                                              Text("Jordan Meurant",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3),
                                            ],
                                          ),
                                          Text(
                                            textAlign: TextAlign.center,
                                            kContactYourFriend,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5,
                                          ),
                                          CustomIconButton(icon: const Icon(FontAwesomeIcons.envelope), title: "jordan.meurant@student.hepl.be",onPressed: (){}),
                                          const OrDividerWidget(),
                                          OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                  side: const BorderSide(
                                                      color: kPrimaryColor)),
                                              onPressed: () {},
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    // <-- Icon
                                                    FontAwesomeIcons.phone,
                                                    color: kPrimaryColor,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      '0471589262',
                                                      style: TextStyle(
                                                          color: kPrimaryColor,
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              'patrick'),
                                                    ),
                                                  )
                                                ],
                                              )),
                                        ],
                                      ),
                                    ));
                          },
                          child: Avatar(
                            sources: [GitHubSource(avatar)],
                            name: avatar,
                            shape: AvatarShape.rectangle(75, 75,
                                const BorderRadius.all(Radius.circular(15))),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 75,
                  viewportFraction: 0.3,
                  onPageChanged: (index, position) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
