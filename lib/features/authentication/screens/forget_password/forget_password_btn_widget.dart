import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPasswordBtnWidget extends StatelessWidget {
  const ForgetPasswordBtnWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  // TODO ADD colors
  //CupertinoColors.systemGrey6
  // Colors.black54

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: 50),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.headline4),
                Text(subTitle),
              ],
            )
          ],
        ),
      ),
    );
  }
}