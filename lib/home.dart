
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/colors.dart';
import 'links/link.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
      child: Row(
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
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
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
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Image.asset("assets/img/logo.png", width: 200),
              const SizedBox(height: 30),
               Text(
                "Synthesis",
                style:  Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 20),
              const Text(
                "Une plateforme pour vous entraider tout le long de votre parcours scolaire !",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: CupertinoColors.systemGrey4,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 90),
              ElevatedButton(
                  onPressed: () {},
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
              orDivider(),
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
              const SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text("Pas de compte ?", style: kFormText,),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Link("Crée-le !", () {}, kBigLink),
                )
              ],
              )
             
            ],
          ),
        ),
      ),
    );
  }
}
