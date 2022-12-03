import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:synthesis/links/link.dart';
import 'package:synthesis/utils/routes.dart';

import '../../../../constants/colors.dart';
import '../../models/model_on_boarding.dart';
import 'on_boarding_page_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  Widget orDivider() {
    return Row(
      children: [
        Flexible(
          child: Container(
            height: 1,
            color: kPrimaryColor,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'ou',
            style: TextStyle(
                fontFamily: "satisfy",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: CupertinoColors.systemGrey4),
          ),
        ),
        Flexible(
          child: Container(
            height: 1,
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }

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
              child: OutlinedButton(
                onPressed: () {
                  controller.animateToPage(page: controller.currentPage + 1);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.black87),
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(10)),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: CupertinoColors.black, shape: BoxShape.circle),
                  child: const Icon(Icons.fast_forward_rounded),
                ),
              )),
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
              bottom: 40,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, loginScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            // <-- Icon
                            Icons.login_rounded,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Connexion',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'patrick'),
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: orDivider()),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CupertinoColors.white),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                            image: AssetImage("assets/img/google_logo.png"),
                            height: 25.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Connexion avec Google',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: CupertinoColors.darkBackgroundGray,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'patrick'),
                            ),
                          )
                        ],
                      )),
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
              ))
        ],
      ),
    );
  }
}
