import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:synthesis/features/authentication/screens/login/login_screen.dart';
import 'package:synthesis/partials/buttons/next_button.dart';
import 'package:synthesis/partials/links/link.dart';
import 'package:synthesis/repository/authentication_controller.dart';
import 'package:synthesis/utils/routes.dart';
import 'package:synthesis/widgets/or_divider_widget.dart';

import '../../../../constants/colors.dart';
import '../../../../partials/buttons/icon_button.dart';
import '../../../../partials/buttons/image_button.dart';
import '../../models/model_on_boarding.dart';
import 'on_boarding_page_widget.dart';

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
    const kBigLink = TextStyle(
      color: kPrimaryColor,
      fontSize: 20,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.none,
    );
    const kFormText = TextStyle(
      color: CupertinoColors.systemGrey4,
      fontSize: 20,
      decoration: TextDecoration.none,
    );
    final pages = [
      OnBoardingPage(
          model: OnBoardingModel(
              image: "assets/img/logo.png",
              title: "Synthesis",
              subTitle:
                  "Une plateforme pour vous entraider tout le long de votre parcours scolaire !",
              counterText: "1/4",
              bgColor: Theme.of(context).backgroundColor,
              height: 10)),
      OnBoardingPage(
          model: OnBoardingModel(
              image: "assets/img/meeting_icon.png",
              title: "Notes & Ressources",
              subTitle:
                  "Marre de jamais trouver les pdf du cours ? Retrouve toutes les notes et ressources partagées au même endroit !",
              counterText: "2/4",
              bgColor: Theme.of(context).colorScheme.tertiary,
              height: 10)),
      OnBoardingPage(
          model: OnBoardingModel(
              image: "assets/img/chat_icon.png",
              title: "Chat",
              subTitle:
                  "T'as pas compris un truc ? Pas de problème, discutes avec tes camarades via un chat dédié ! Tu pourras leur poser plein de questions...",
              counterText: "3/4",
              bgColor: Theme.of(context).backgroundColor,
              height: 10)),
      OnBoardingPage(
          model: OnBoardingModel(
              image: "assets/img/file_and_folder.png",
              title: "Notes hors ligne",
              subTitle:
                  "Accèdes aux notes que tu as téléchargé en mode offline !",
              counterText: "4/4",
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
                      title: 'Connexion',
                      onPressed: () => Get.to(() => const LoginScreen())),
                  const OrDividerWidget(),
                  ImageButton(
                      imageURL: 'assets/img/google_logo.png',
                      title: 'Connexion avec Google',
                      onPressed: () {
                        AuthenticationController.instance.signInWithGoogle();
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Pas de compte ?",
                        style: kFormText,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Link("Crée-le !", () {
                          Navigator.pushNamed(context, registerScreen);
                        }, kBigLink),
                      )
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
