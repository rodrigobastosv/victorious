import 'package:flutter/material.dart';

class VSTitle extends StatelessWidget {
  final String title;

  const VSTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Bebas',
          fontSize: 32,
        ),
      ),
    );
  }
}
