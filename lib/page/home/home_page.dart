import 'package:flutter/material.dart';
import 'package:victorious/page/home/widget/comments.dart';

import '../events/events_page.dart';
import '../fighters/fighters_page.dart';
import 'widget/footer.dart';
import 'widget/header_hoverable_button.dart';
import 'widget/news.dart';
import 'widget/next_events.dart';
import 'widget/sponsors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'web/images/logo.png',
          height: 40,
        ),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            NextEvents(),
            const SizedBox(height: 48),
            News(),
            const SizedBox(height: 48),
            Comments(),
            const SizedBox(height: 48),
            Sponsors(),
            const SizedBox(height: 24),
            Footer(),
          ],
        ),
      ),
    );
  }
}
