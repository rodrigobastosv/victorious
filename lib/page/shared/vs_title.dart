import 'package:flutter/material.dart';

class VSTitle extends StatelessWidget {
  final String title;

  const VSTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Heading Pro',
          fontSize: MediaQuery.of(context).size.width > 768 ? 32 : 20,
        ),
      ),
    );
  }
}
