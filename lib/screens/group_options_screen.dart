import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:synthesis/constants/text_strings.dart';
import 'package:synthesis/screens/create_group_screen.dart';
import 'package:synthesis/screens/join_group_screen.dart';
import '../../../../../widgets/or_divider_widget.dart';
import '../widgets/modal_option_btn_widget.dart';

class GroupOptionsScreen {
  static Future<dynamic> buildModalOptionsJoinGroup(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      context: context,
      builder: (context) => SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(kChooseOption,
                style: Theme.of(context).textTheme.headline3),
            Text(kSelectOptionBelowToJoinGroup,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 30,
            ),
            ModalOptionBtnWidget(
                title: kJoinGroup,
                subTitle: kUseGroupCode,
                icon: FontAwesomeIcons.peopleGroup,
                onTap: () {
                  Get.to(()=> const JoinGroupScreen());
                }),
            const OrDividerWidget(),
            ModalOptionBtnWidget(
                title: kCreateGroup,
                subTitle: kCreateGroupLikeYouWant,
                icon: FontAwesomeIcons.userPlus,
                onTap: () {
                  Get.to(()=> const CreateGroupScreen());
                })
          ],
        ),
      ),
    );
  }
}
