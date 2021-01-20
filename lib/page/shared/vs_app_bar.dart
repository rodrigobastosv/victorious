import 'package:flutter/material.dart';

import '../calendar/calendar_page.dart';
import '../fighters/fighters_page.dart';
import '../home/home_page.dart';
import '../home/widget/header_hoverable_button.dart';
import '../videos/videos_page.dart';

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
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<Widget>(
              builder: (buildContext) => CalendarPage(),
            ),
          ),
        ),
        HeaderHoverableButton(
          text: 'Videos',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<Widget>(
              builder: (buildContext) => VideosPage(),
            ),
          ),
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
