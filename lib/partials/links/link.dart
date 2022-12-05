import 'package:flutter/cupertino.dart';

class Link extends StatelessWidget {
  final String _text;

  final TextStyle _style;

  const Link(this._text,this._onTap, this._style, {super.key});

  final GestureTapCallback _onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Text(
        _text,
       style: _style,
      ),
    );
  }
}
