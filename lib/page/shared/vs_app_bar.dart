import 'package:flutter/material.dart';

import '../fighters/fighters_page.dart';
import '../home/home_page.dart';
import '../home/widget/header_hoverable_button.dart';

class VSAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: InkWell(
        child: Image.asset(
          'web/images/logo.png',
          height: 36,
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<Widget>(
            builder: (buildContext) => HomePage(),
          ),
        ),
      ),
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      actions: [
        HeaderHoverableButton(
          text: 'Quem somos',
          onPressed: () {},
        ),
        HeaderHoverableButton(
          text: 'Lutadores',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<Widget>(
              builder: (buildContext) => FightersPage(),
            ),
          ),
        ),
        HeaderHoverableButton(
          text: 'Calendario',
          onPressed: () {},
        ),
        HeaderHoverableButton(
          text: 'Videos',
          onPressed: () {},
        ),
        HeaderHoverableButton(
          text: 'Blog',
          onPressed: () {},
        ),
        HeaderHoverableButton(
          text: 'Contato',
          onPressed: () {},
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
