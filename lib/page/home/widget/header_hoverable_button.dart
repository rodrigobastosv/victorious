import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class HeaderHoverableButton extends StatelessWidget {
  const HeaderHoverableButton({
    Key key,
    this.onHover,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  final PointerEnterEvent onHover;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      onHover: (_) => onHover,
      hoverChild: Parallelogram(
        cutLength: 20,
        child: InkWell(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Bebas',
                fontSize: 18,
              ),
            ),
          ),
          onTap: onPressed,
        ),
      ),
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Bebas',
              fontSize: 18,
              color: Theme.of(context).appBarTheme.textTheme.button.color,
            ),
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
