
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton(
      {Key? key, required this.imageURL, required this.title, this.onPressed})
      : super(key: key);

  final String imageURL;
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: CupertinoColors.white),
        icon: Image(image: AssetImage(imageURL), height: 25),
        label: Text(title,
            style: TextStyle(
                fontSize: 25, color: Theme.of(context).colorScheme.secondary)),
      ),
    );
  }
}