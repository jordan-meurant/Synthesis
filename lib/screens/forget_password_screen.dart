import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:synthesis/constants/text_strings.dart';
import 'package:synthesis/utils/routes.dart';
import '../widgets/or_divider_widget.dart';
import '../widgets/modal_option_btn_widget.dart';

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
            Text(kChooseOption,
                style: Theme.of(context)
                    .textTheme
                    .headline3),
            Text(kSelectOptionBelow,
              style:
              Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 30,
            ),
            ModalOptionBtnWidget(
              title: kEmail,
              subTitle: kResetByEmail,
              icon: FontAwesomeIcons.paperPlane,
              onTap: () {Navigator.pushNamed(context, resetPasswordByEmailScreen);},
            ),
            const OrDividerWidget(),
            ModalOptionBtnWidget(
                title: kPhoneNo,
                subTitle: kNotAvailabe,
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
