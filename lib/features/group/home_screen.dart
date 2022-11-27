import 'package:avatars/avatars.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_card/image_card.dart';
import 'package:synthesis/constants/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:synthesis/features/group/group_selection_btn_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String nameGroup = "MASI";

  @override
  Widget build(BuildContext context) {
    final avatars = [
      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
      "https://avatars.githubusercontent.com/u/46026917?v=4",
      "LoicBourge"
    ];

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
                  ElevatedButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Icon(FontAwesomeIcons.bars)),
                  Container(width:150, height:100,child: const GroupSelectionBtnWidget()),
                  Avatar(sources: [
                    NetworkSource(
                        "https://learning.oilab.in/public/img/Flutter-course-in-jodhpur.png")
                  ], name: "jordan", shape: AvatarShape.circle(25)),
                ],
              ),
              Text(
                "Groupe : $nameGroup",
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: "yes")).then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Code de groupe copié !"),
                        behavior: SnackBarBehavior.floating,
                      ));
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(FontAwesomeIcons.share),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Code de group',
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
                    "Cours",
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
                items: const [
                  TransparentImageCard(
                    endColor: CupertinoColors.systemYellow,
                    width: double.infinity,
                    imageProvider: NetworkImage(
                        "https://learning.oilab.in/public/img/Flutter-course-in-jodhpur.png"),
                    title: Text("Flutter"),
                  ),
                  TransparentImageCard(
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
                    setState(() {
                      //_currentMovie = index;
                    });
                  },
                ),
              ),
              Text(
                "Participants :",
                style: Theme.of(context).textTheme.headline4,
              ),
              CarouselSlider(
                items: avatars
                    .map((avatar) => Avatar(
                          sources: [
                            NetworkSource(avatar)
                          ],
                          name: avatar,
                          shape: AvatarShape.rectangle(75, 75,
                              const BorderRadius.all(Radius.circular(15))),
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 75,
                  viewportFraction: 0.3,
                  onPageChanged: (index, position) {
                    setState(() {
                      //_currentMovie = index;
                    });
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}