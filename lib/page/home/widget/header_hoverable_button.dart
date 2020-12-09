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
        child: Container(
          width: 180,
            child: FlatButton(
              color: Colors.white,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              textColor: Theme.of(context).appBarTheme.textTheme.button.color,
              onPressed: onPressed,
            ),
          ),
      ),
      child: FlatButton(
        child: Text(
          text,
        ),
        textColor: Theme.of(context).appBarTheme.textTheme.button.color,
        onPressed: onPressed,
      ),
    );
  }
}
