import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:synthesis/constants/text_strings.dart';
import 'package:synthesis/screens/login_screen.dart';
import 'package:synthesis/partials/buttons/google_signin_button.dart';
import 'package:synthesis/partials/buttons/next_button.dart';
import 'package:synthesis/partials/links/link.dart';
import 'package:synthesis/widgets/dont_have_account_widget.dart';
import 'package:synthesis/widgets/or_divider_widget.dart';

import '../constants/colors.dart';
import '../partials/buttons/icon_button.dart';
import '../models/model_on_boarding.dart';
import '../widgets/on_boarding_page_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = LiquidController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {

    final pages = [
      OnBoardingPage(
          model: OnBoardingModel(
              image: "assets/img/logo.png",
              title: kAppName,
              subTitle: kAppDescription,
              bgColor: Theme.of(context).backgroundColor,
              height: 10)),
      OnBoardingPage(
          model: OnBoardingModel(
              image: "assets/img/meeting_icon.png",
              title: kNotesAndResources,
              subTitle: kNotesAndResourcesDescription,
              bgColor: Theme.of(context).colorScheme.tertiary,
              height: 10)),
      OnBoardingPage(
          model: OnBoardingModel(
              image: "assets/img/chat_icon.png",
              title: kChat,
              subTitle: kChatDescription,
              bgColor: Theme.of(context).backgroundColor,
              height: 10)),
      OnBoardingPage(
          model: OnBoardingModel(
              image: "assets/img/file_and_folder.png",
              title: kOfflineNotes,
              subTitle: kOfflineNotes,
              bgColor: Theme.of(context).colorScheme.tertiary,
              height: 10)),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            key: widget.key,
            liquidController: controller,
            onPageChangeCallback: (activePageIndex) => {
              setState(() {
                currentPage = activePageIndex;
              })
            },
            pages: pages,
            slideIconWidget: const Icon(
              Icons.arrow_back_ios,
            ),
            enableSideReveal: true,
            enableLoop: true,
          ),
          Positioned(
              top: 50,
              right: 40,
              child: NextButton(onPressed: () {
                controller.animateToPage(page: controller.currentPage + 1);
              })),
          Positioned(
            bottom: 220,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: pages.length,
              effect: WormEffect(
                  activeDotColor: Theme.of(context).colorScheme.primary,
                  dotHeight: 8),
            ),
          ),
          Positioned(
              width: MediaQuery.of(context).size.width * 0.7,
              bottom: 40,
              child: Column(
                children: [
                  CustomIconButton(
                      icon: const Icon(FontAwesomeIcons.arrowRightToBracket),
                      title: kLogin,
                      onPressed: () => Get.to(() => const LoginScreen())),
                  const OrDividerWidget(),
                  const GoogleSignUpButton(),
                  const DontHaveAccountWidget()
                ],
              )),
        ],
      ),
    );
  }
}

