import 'package:flutter/material.dart';

import '../events/events_page.dart';
import '../fighters/fighters_page.dart';
import '../home/widget/header_hoverable_button.dart';

class VSAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'web/images/logo.png',
        height: 40,
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
          text: 'Eventos',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<Widget>(
              builder: (buildContext) => EventsPage(),
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
        const SizedBox(width: 16),
      ],
    );
  }
}
