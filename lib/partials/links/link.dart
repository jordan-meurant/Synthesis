import 'package:flutter/cupertino.dart';

import '../../constants/styles.dart';

class Link extends StatelessWidget {
  final String _text;

  final TextStyle style;

  const Link(this._text,this._onTap, {super.key,this.style = kBigLink});

  final GestureTapCallback _onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Text(
        _text,
       style: style,
      ),
    );
  }
}
