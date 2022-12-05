import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key, required this.icon, required this.title, this.onPressed})
      : super(key: key);

  final String title;
  final Icon icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(title,
            style: TextStyle(
                fontSize: 25, color: Theme.of(context).colorScheme.secondary)),
      ),
    );
  }
}