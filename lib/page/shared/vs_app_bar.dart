import 'package:flutter/material.dart';

import '../blog/blog_page.dart';
import '../calendar/calendar_page.dart';
import '../contact/contact_page.dart';
import '../fighters/fighters_page.dart';
import '../home/home_page.dart';
import '../home/widget/header_hoverable_button.dart';
import '../quem_somos/quem_somos_page.dart';
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
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<Widget>(
              builder: (buildContext) => QuemSomosPage(),
            ),
          ),
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
          text: 'Calendário',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<Widget>(
              builder: (buildContext) => CalendarPage(),
            ),
          ),
        ),
        HeaderHoverableButton(
          text: 'Vídeos',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<Widget>(
              builder: (buildContext) => VideosPage(),
            ),
          ),
        ),
        HeaderHoverableButton(
          text: 'Blog',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<Widget>(
              builder: (buildContext) => BlogPage(),
            ),
          ),
        ),
        HeaderHoverableButton(
          text: 'Contato',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<Widget>(
              builder: (buildContext) => ContactPage(),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
