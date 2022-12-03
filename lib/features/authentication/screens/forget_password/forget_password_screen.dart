import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:synthesis/utils/routes.dart';
import '../../../../widgets/or_divider_widget.dart';
import 'forget_password_btn_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  static Future<dynamic> buildModalOptionsForgetPassword(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Choisis une option !",
                style: Theme.of(context)
                    .textTheme
                    .headline3),
            Text(
              "Sélectionner une des options ci-dessous pour rénitialiser votre mot de passe",
              style:
              Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 30,
            ),
            ForgetPasswordBtnWidget(
              title: "Email",
              subTitle: "Réinitialisation par email",
              icon: FontAwesomeIcons.paperPlane,
              onTap: () {Navigator.pushNamed(context, resetPasswordByEmailScreen);},
            ),
            const OrDividerWidget(),
            ForgetPasswordBtnWidget(
                title: "N° de téléphone",
                subTitle: "Pas encore disponible...",
                icon: FontAwesomeIcons.commentSms,
                onTap: () {})
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
